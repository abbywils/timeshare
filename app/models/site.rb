class Site < ApplicationRecord
  validates :sitename, :description,  :country_id, :dateinscribed, :longitude, :latitude, :area, :sitetype, :countryname, presence: true
  belongs_to :country
end