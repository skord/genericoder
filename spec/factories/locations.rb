# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    country_code "MyString"
    region_code "MyString"
    city "MyString"
    postal_code "MyString"
    latitude "9.99"
    longitude "9.99"
    metro_code "MyString"
    area_code "MyString"
  end
end
