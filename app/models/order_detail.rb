class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { unstartable: 0, awaiting_manufacture: 1, in_production: 2, production_complete: 3 }

end
