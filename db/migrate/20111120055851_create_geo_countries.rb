class CreateGeoCountries < ActiveRecord::Migration
  def self.up
    down
    create_table :geo_countries do |t|
      t.string  :name_en
      t.string  :alpha2
      t.string  :alpha3
      t.string  :un_m49
      t.string  :iso
    end
  end

  def self.down
    drop_table :geo_countries
  end
end
