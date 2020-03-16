require 'csv'
namespace :parsing do
  desc "Pull data for countries into the database"
  task seed_everything: :environment do

    #drop the old table data before importing the new stuff
    Country.destroy_all

    CSV.foreach("lib/assets/country.csv", :headers =>true, encoding: "utf-8") do |row |
      puts 
      # row.inspect #just so that we know the file's being read

      # only create country entry if it does not exist already
      if !Country.exists?(countryname: row[0])
        #create new model instances with the data
        Country.create!(
          countryname: row[0],
          region: row[1],
        )
      end
    end
    
    #drop the old table data before importing the new stuff
    Site.destroy_all

    CSV.foreach("lib/assets/sites.csv", :headers =>true, encoding: "utf-8") do |row |
      # puts row.inspect #just so that we know the file's being read
      
      country = Country.where(["countryname = ?", row[8]]).first
      #create new model instances with the data
      Site.create!(
      sitename: row[1],
      description: row[2],
      dateinscribed: row [3].to_i,
      latitude: row[5].to_d,
      longitude: row[4].to_d,
      area: row[6].to_d,
      sitetype: row [7],
      country_id: country.id
      )
    end
  end

end

