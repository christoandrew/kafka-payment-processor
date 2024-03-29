class PaymentCreationService < ApplicationService
  def initialize(payment_account, amount, payload = nil, currency = nil)
    Rails.logger.info "PaymentCreationService#initialize"
    @payment_account = payment_account
    @amount = amount
    @currency = currency

    unless @payment_account && @amount
      @payment_account = PaymentAccount.find_by(id: payload["account_id"])
      @amount = payload["amount"]
      @currency = payload["currency"]
    end
  end

  def call
    Rails.logger.info "PaymentCreationService#call"
    Payment.create!(payment_account: @payment_account, amount: @amount, currency: @currency)
  end
end
