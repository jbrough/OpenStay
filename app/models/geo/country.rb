class Geo::Country < ActiveRecord::Base

  def self.bootstrap!
    delete_all
    CSV.foreach(Rails.root.join('lib', 'csv', 'country_codes.csv')) do |c|
      new(:name_en => c[0], :alpha2 => c[1], :alpha3 => c[2], :un_m49 => c[3], :iso => c[4]).save
    end
    #connection.execute "COPY geo_countries FROM '#{Rails.root.join('lib', 'csv', 'country_codes.csv')}' CSV;"
  end
end
