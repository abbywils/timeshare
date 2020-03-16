class TimeshareController < ApplicationController
  def index
    @sitetypes = Site.select(:sitetype).distinct
    @countries = Country.all
    @regions = Country.select(:region).distinct
    
    @sites = Site.search(
      sitetype: params[:sitetype],
      country_id: params[:country_id],
      region: params[:region]
    ).includes(:country)
    
    @markers = []
    @sites.each do |site|
      @markers << {
        :latlng => [site.latitude, site.longitude]
      }
    end

    @displayResults = params[:commit] == "Search" && @sites.count != 0
    @displayMessage = params[:commit] == "Search" && @sites.count == 0
  end
end

