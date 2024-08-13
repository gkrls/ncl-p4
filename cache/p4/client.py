import socket


soc = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
soc.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEPORT, 1)
soc.bind(("42.0.0.1", 4242))


soc.sendto(bytes("hello", 'utf-8'), ("42.0.0.4", 4242))