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

      
      country = Country.where(["countryname = ?", row[7]]).first
      #create new model instances with the data
      Site.create!(
        sitename: row[0],
        description: row[1],
        dateinscribed: row [2].to_i,
        latitude: row[4].to_d,
        longitude: row[3].to_d,
        area: row[5].to_d,
        sitetype: row [6],
        cost: row [8].to_i,
        totalshares: row [9].to_i,
        code: row [10].to_i,
        country_id: country.id
      )
    end
  end
end

