class Payment < ApplicationRecord
  belongs_to :payment_account

  delegate :customer, to: :payment_account, allow_nil: true
end
