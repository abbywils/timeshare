class Country < ApplicationRecord
    has_many :sites
    validates :countryname, :region, presence: true
end
