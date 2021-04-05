FactoryBot.define do
  factory :item do
    name { 'りんご' }
    introduce { 'これは大好きなりんごです' }
    category_id { 6 }
    state_id { 4 }
    shipping_id { 3 }
    region_id { 2 }
    day_id { 3 }
    price { 800 }

    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
