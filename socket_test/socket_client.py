#!P:/prog/python/python27/python

import socket

s = socket.socket()
hostname = socket.gethostname()
port = 8100
s.connect((hostname, port))

print(s.recv(1024))
s.close()
