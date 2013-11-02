require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

GEOLITE_CITY_FILE = "/Users/mike/Projects/maxmind/GeoLiteCity_20131001/GeoLiteCity-Location.csv"

if GEOLITE_CITY_FILE
  CSV.open(GEOLITE_CITY_FILE, encoding: "ISO-8859-1") do |csv|
    csv.shift
    csv.shift
    while values = csv.shift
      location = Location.new( country_code: values[1],
                               region_code: values[2],
                               city: values[3],
                               postal_code: values[4],
                               latitude: values[5],
                               longitude: values[6],
                               metro_code: values[7],
                               area_code: values[8]
                              )
      location.try(:save)


    end
  end
  Sunspot.commit
end
