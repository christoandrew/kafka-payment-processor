class PaymentReceivedConsumer < ApplicationConsumer
  def consume
    messages.each do |message|
      PaymentCreationService.call(nil, nil, message.payload)
    end
  end
end