**payment-aggregator (ALMS)** </br> 
Weird name but simulates payment received on alms with some meta data

**backend (PH)** Simulates actions or services run when an event is received
There are 2 services at the moment one that creates the payment and one that creates the
short messages check `app/services`
These services are triggered by consumers in `app/consumers`. Logic is such that after a payment service is
called we run the sms creation service. 
