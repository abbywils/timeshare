class Site < ApplicationRecord
  validates :sitename, :description,  :country_id, :dateinscribed, :longitude, :latitude, :area, :sitetype, :countryname, presence: true
  belongs_to :country
  

def self.search(sitetype: "", country_id: "", region: "")
    results = Site.all
    
    if !sitetype.blank?
      results = results.where("sitetype = ?", sitetype)
    end
    
    if !country_id.blank?
      results = results.where("country_id = ?", country_id)
    end
    
    if !region.blank? 
      results = results.joins(:country).where("countries.region = ?", region)
    end
      
    return results.order(sitename: :asc)
  end
end