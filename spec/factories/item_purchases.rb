FactoryBot.define do
  factory :item_purchase do
    post { '123-4567'}
    region_id { 9 }
    city { '山田市' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '01234567890' }
    token {"tok_abcdefghijk00000000000000000"}
    
    association :user
    association :item
  end
end
