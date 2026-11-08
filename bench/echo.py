import asyncio
class U(asyncio.DatagramProtocol):
    def connection_made(self, t): self.t = t
    def datagram_received(self, d, a): self.t.sendto(d, a)
async def h(r, w):
    try:
        while True:
            d = await r.read(65536)
            if not d: break
            w.write(d)
            await w.drain()
    except Exception: pass
    w.close()
async def main():
    loop = asyncio.get_running_loop()
    await loop.create_datagram_endpoint(U, local_addr=('127.0.0.1', 7778))
    s = await asyncio.start_server(h, '127.0.0.1', 7777)
    await s.serve_forever()
asyncio.run(main())
