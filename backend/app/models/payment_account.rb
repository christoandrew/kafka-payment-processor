class PaymentAccount < ApplicationRecord
  belongs_to :customer
  has_many :payments, dependent: :destroy
end
