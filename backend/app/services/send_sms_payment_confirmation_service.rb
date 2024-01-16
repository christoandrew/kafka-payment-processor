# frozen_string_literal: true
class SendSmsPaymentConfirmationService
  def initialize(payment_id:)
    @payment = Payment.find(payment_id)
    @customer = @payment.customer
    raise 'Payment not found' unless @payment
  end

  def call
    ShortMessage.build(
      payment: @payment
    )
  end
end
