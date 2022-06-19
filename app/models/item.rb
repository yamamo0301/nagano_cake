class Item < ApplicationRecord
  attachment :image_id

  belongs_to :genres
end
