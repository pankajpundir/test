#!P:/prog/python/python27/python

import socket

s = socket.socket()
hostname = socket.gethostname()
port = 8100
s.bind((hostname, port))

s.listen(5)
while True:
    conn, addr = s.accept()
    print("Got connection from {}".format(addr))
    conn.send("Thank you for connecting to {}".format(hostname))
    conn.close()
