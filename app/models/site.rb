class Site < ApplicationRecord
  validates :sitename, :description,  :country_id, :dateinscribed, :longitude, :latitude, :area, :sitetype, presence: true
  belongs_to :country
  has_many :line_items
  

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
  
  
  
    before_destroy :ensure_not_referenced_by_any_line_item
  
  #...
  
  private
  
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
end