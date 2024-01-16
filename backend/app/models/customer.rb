class Customer < ApplicationRecord
  has_many :payment_accounts, dependent: :destroy
  has_many :payments, through: :payment_accounts, source: :payments

  def to_s
    name
  end
end
