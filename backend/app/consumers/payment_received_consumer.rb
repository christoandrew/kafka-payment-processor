class PaymentReceivedConsumer < ApplicationConsumer
  def consume
    messages.each do |message|
      payment = PaymentCreationService.call(nil, nil, message.payload)
      Karafka.logger.info "Payment received: #{message.payload}"
      producer.produce_async(
        payload: {
          payment_id: payment.id,
          event_id: message.payload['event_id']
        }.to_json,
        topic: 'payment_processed'
      )
    end
  end
end