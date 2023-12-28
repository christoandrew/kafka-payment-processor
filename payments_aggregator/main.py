import uuid

from fastapi import FastAPI
from models import Payment
from kafka import get_producer, acked

app = FastAPI()

payment_received_topic = "payment_received"

@app.post("/create_payment")
async def create_payment(payment: Payment):
    key = uuid.uuid4().hex
    payment.event_id = key
    producer = get_producer()
    producer.produce(payment_received_topic, key=key, value=payment.model_dump_json(), callback=acked)
    producer.poll(1)
    return payment

@app.get("/ping")
def ping():
    return "PONG"


