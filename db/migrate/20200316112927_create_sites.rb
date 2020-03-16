class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :sitename
      t.string :description
      t.integer :dateinscribed
      t.decimal :longitude
      t.decimal :latitude
      t.decimal :area
      t.string :sitetype
      t.string :countryname
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
