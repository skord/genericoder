class Location < ActiveRecord::Base
  searchable do
    text :country_code
    text :region_code
    text :city
    text :postal_code
    latlon(:location) {Sunspot::Util::Coordinates.new(latitude, longitude)}
  end
end
