FactoryBot.define do
  factory :purchase_address do

    user_id               {1}
    item_id               {1}
    postal_code           { '123-4567' }
    prefecture_id         {1}
    city                  { '港区' }
    house_number          { '芝' }
    building_name         { 'ビル' }
    phone_number          { '09012345678' }
    token                 { 'aaa' }
    
  end
end
