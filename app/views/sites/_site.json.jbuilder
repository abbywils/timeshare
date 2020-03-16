json.extract! site, :id, :sitename, :description, :dateinscribed, :longitude, :latitude, :area, :category, :countryname, :country_id, :created_at, :updated_at
json.url site_url(site, format: :json)
