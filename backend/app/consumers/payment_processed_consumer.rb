# frozen_string_literal: true
class PaymentProcessedConsumer < ApplicationConsumer
  def consume
    messages.each do |message|
      payment = Payment.find(message.payload['payment_id'])
      ::SendSmsPaymentConfirmationService.new(payment_id: payment.id).call
    end
  end
end
