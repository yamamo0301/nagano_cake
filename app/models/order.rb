class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  def postage
    800
  end

  def payment
    0 + postage
  end

  enum payment_method: { credit_card: 0, transfer: 1 }

end
