class Item < ApplicationRecord
  attachment :image_id

  belongs_to :genre
end
