class ShortMessage < ApplicationRecord
  belongs_to :payment, optional: true
  belongs_to :customer, optional: true

  def before_initialize
    self.customer ||= self.payment.customer
  end

  def self.build(payment:)
    create!(
      payment: payment,
      customer: payment.customer,
      text: "Dear #{payment.customer}, Your payment of #{payment.amount} has been processed."
    )
  end

  def to_s
    "ShortMessage #{id}"
  end
end
