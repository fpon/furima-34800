FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.free_email }
    password { 'aaaaa1' }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'タロウ' }
    birthday { '1995-03-01' }
  end
end
