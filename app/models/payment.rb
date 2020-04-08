class Payment < ApplicationRecord
    validates :total , presence: true
    belongs_to :user
    has_many :reservations
end