import pika


def callback(ch, method, properties, body):
    print(" [x] Received \"{0}\"".format(body))
    print(" Channel = {0}".format(ch))
    print(" Method = {0}".format(method))
    print(" Properties = {0}".format(properties))

HOST = "localhost"

connection = pika.BlockingConnection(pika.ConnectionParameters(HOST))
channel = connection.channel()
channel.queue_declare(queue="hello")
channel.basic_consume(callback, queue="hello", no_ack=True)
channel.start_consuming()
