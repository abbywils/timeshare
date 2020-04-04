class LineItem < ApplicationRecord
  belongs_to :site
  belongs_to :cart
end
