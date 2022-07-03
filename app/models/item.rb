class Item < ApplicationRecord
  attachment :image

  belongs_to :genre
  has_many :cart_items
  
  def with_tax_price
    (price * 1.1).floor
  end
end
