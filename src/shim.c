/* Thin C shim: wraps ngtcp2's versioned-function macros and the OpenSSL
 * bits (macros, callbacks) so the Zig side never has to translate
 * openssl/ssl.h. Everything else lives in Zig. */
#include <string.h>
#include <ngtcp2/ngtcp2.h>
#include <ngtcp2/ngtcp2_crypto.h>
#include <ngtcp2/ngtcp2_crypto_ossl.h>
#include <openssl/ssl.h>
#include <openssl/err.h>

int tz_conn_read_pkt(ngtcp2_conn *c, const ngtcp2_path *p, const ngtcp2_pkt_info *pi,
                     const uint8_t *pkt, size_t len, ngtcp2_tstamp ts) {
  return ngtcp2_conn_read_pkt(c, p, pi, pkt, len, ts);
}
ngtcp2_ssize tz_conn_writev_stream(ngtcp2_conn *c, ngtcp2_path *p, ngtcp2_pkt_info *pi,
                                   uint8_t *dest, size_t destlen, ngtcp2_ssize *pdatalen,
                                   uint32_t flags, int64_t sid, const ngtcp2_vec *v,
                                   size_t vcnt, ngtcp2_tstamp ts) {
  return ngtcp2_conn_writev_stream(c, p, pi, dest, destlen, pdatalen, flags, sid, v, vcnt, ts);
}
ngtcp2_ssize tz_conn_writev_datagram(ngtcp2_conn *c, ngtcp2_path *p, ngtcp2_pkt_info *pi,
                                     uint8_t *dest, size_t destlen, int *accepted,
                                     uint32_t flags, uint64_t id, const ngtcp2_vec *v,
                                     size_t vcnt, ngtcp2_tstamp ts) {
  return ngtcp2_conn_writev_datagram(c, p, pi, dest, destlen, accepted, flags, id, v, vcnt, ts);
}
ngtcp2_ssize tz_conn_write_connection_close(ngtcp2_conn *c, ngtcp2_path *p, ngtcp2_pkt_info *pi,
                                            uint8_t *dest, size_t destlen,
                                            const ngtcp2_ccerr *e, ngtcp2_tstamp ts) {
  return ngtcp2_conn_write_connection_close(c, p, pi, dest, destlen, e, ts);
}
ngtcp2_ssize tz_conn_write_aggregate_pkt2(ngtcp2_conn *c, ngtcp2_path *p, ngtcp2_pkt_info *pi,
                                          uint8_t *buf, size_t buflen, size_t *gso,
                                          ngtcp2_write_pkt cb, size_t npkts, ngtcp2_tstamp ts) {
  return ngtcp2_conn_write_aggregate_pkt2(c, p, pi, buf, buflen, gso, cb, npkts, ts);
}
int tz_conn_server_new(ngtcp2_conn **pc, const ngtcp2_cid *dcid, const ngtcp2_cid *scid,
                       const ngtcp2_path *path, uint32_t ver, const ngtcp2_callbacks *cb,
                       const ngtcp2_settings *s, const ngtcp2_transport_params *tp,
                       void *ud) {
  return ngtcp2_conn_server_new(pc, dcid, scid, path, ver, cb, s, tp, NULL, ud);
}
void tz_settings_default(ngtcp2_settings *s) { ngtcp2_settings_default(s); }
void tz_transport_params_default(ngtcp2_transport_params *p) { ngtcp2_transport_params_default(p); }

/* ---------------- TLS ---------------- */

typedef struct {
  unsigned char alpn[256];
  size_t alpnlen;
} tz_alpn;
static tz_alpn g_alpn;

static int alpn_select_cb(SSL *ssl, const unsigned char **out, unsigned char *outlen,
                          const unsigned char *in, unsigned int inlen, void *arg) {
  (void)ssl; (void)arg;
  if (g_alpn.alpnlen == 0) return SSL_TLSEXT_ERR_NOACK;
  /* server preference order */
  for (size_t i = 0; i < g_alpn.alpnlen; i += 1 + g_alpn.alpn[i]) {
    const unsigned char *sp = &g_alpn.alpn[i];
    for (unsigned int j = 0; j < inlen; j += 1 + in[j]) {
      if (in[j] == sp[0] && j + 1 + in[j] <= inlen && memcmp(&in[j + 1], sp + 1, sp[0]) == 0) {
        *out = &in[j + 1];
        *outlen = in[j];
        return SSL_TLSEXT_ERR_OK;
      }
    }
  }
  return SSL_TLSEXT_ERR_ALERT_FATAL; /* same as rustls: no_application_protocol */
}

int tz_crypto_init(void) { return ngtcp2_crypto_ossl_init(); }

void *tz_tls_ctx_new(const char *cert, const char *key, const unsigned char *alpn,
                     size_t alpnlen, int early_data) {
  SSL_CTX *ctx = SSL_CTX_new(TLS_server_method());
  if (!ctx) return NULL;
  SSL_CTX_set_min_proto_version(ctx, TLS1_3_VERSION);
  SSL_CTX_set_max_proto_version(ctx, TLS1_3_VERSION);
  SSL_CTX_set_options(ctx, (SSL_OP_ALL & ~SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS) |
                               SSL_OP_SINGLE_ECDH_USE | SSL_OP_CIPHER_SERVER_PREFERENCE |
                               SSL_OP_NO_ANTI_REPLAY);
  SSL_CTX_set_ciphersuites(ctx, "TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256");
  SSL_CTX_set1_groups_list(ctx, "X25519:P-256:P-384");
  SSL_CTX_set_mode(ctx, SSL_MODE_RELEASE_BUFFERS);
  if (early_data) SSL_CTX_set_max_early_data(ctx, UINT32_MAX);
  if (alpnlen > sizeof(g_alpn.alpn)) alpnlen = sizeof(g_alpn.alpn);
  memcpy(g_alpn.alpn, alpn, alpnlen);
  g_alpn.alpnlen = alpnlen;
  SSL_CTX_set_alpn_select_cb(ctx, alpn_select_cb, NULL);
  if (SSL_CTX_use_PrivateKey_file(ctx, key, SSL_FILETYPE_PEM) != 1 ||
      SSL_CTX_use_certificate_chain_file(ctx, cert) != 1 ||
      SSL_CTX_check_private_key(ctx) != 1) {
    ERR_print_errors_fp(stderr);
    SSL_CTX_free(ctx);
    return NULL;
  }
  return ctx;
}

/* Creates SSL + ngtcp2 ossl ctx, attaches to conn. Returns 0 on success. */
int tz_conn_tls_new(void *sslctx, ngtcp2_conn *conn, ngtcp2_crypto_conn_ref *ref,
                    int early_data, void **pssl, void **possl) {
  ngtcp2_crypto_ossl_ctx *octx = NULL;
  if (ngtcp2_crypto_ossl_ctx_new(&octx, NULL) != 0) return -1;
  SSL *ssl = SSL_new((SSL_CTX *)sslctx);
  if (!ssl) { ngtcp2_crypto_ossl_ctx_del(octx); return -1; }
  ngtcp2_crypto_ossl_ctx_set_ssl(octx, ssl);
  if (ngtcp2_crypto_ossl_configure_server_session(ssl) != 0) {
    SSL_free(ssl); ngtcp2_crypto_ossl_ctx_del(octx); return -1;
  }
  SSL_set_app_data(ssl, ref);
  SSL_set_accept_state(ssl);
  if (early_data) SSL_set_quic_tls_early_data_enabled(ssl, 1);
  ngtcp2_conn_set_tls_native_handle(conn, octx);
  *pssl = ssl;
  *possl = octx;
  return 0;
}

void tz_conn_tls_free(void *ssl, void *octx) {
  if (octx) ngtcp2_crypto_ossl_ctx_del((ngtcp2_crypto_ossl_ctx *)octx);
  if (ssl) SSL_free((SSL *)ssl);
}

int tz_export_token(void *ssl, const uint8_t *label, size_t labellen, const uint8_t *ctx,
                    size_t ctxlen, uint8_t out[32]) {
  return SSL_export_keying_material((SSL *)ssl, out, 32, (const char *)label, labellen, ctx,
                                    ctxlen, 1) == 1 ? 0 : -1;
}
