from confluent_kafka import Producer
import socket

conf = {
        "bootstrap.servers": "192.168.1.109:9092",
        "client.id": socket.gethostname()
        }

def acked(err, msg):
    if err is not None:
        print("Failed to deliver message: %s: %s" % (str(msg), str(err)))
    else:
        print("Message produced: %s" % (str(msg)))

def get_producer():
    return Producer(conf)
