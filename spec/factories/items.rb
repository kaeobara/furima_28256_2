FactoryBot.define do
  factory :item do

    name                  {'テスト'}
    introduction          {'テスト用のダミーデータです'}
    category_id           {1}
    item_condition_id     {1}
    postage_payer_id      {1}
    prefecture_id         {1}
    shipping_day_id       {1}
    price                 {2000}
    association :user
    # trait :with_image do
    #   after(:build) { |item| item.image.attach(io: File.open(Rails.root.join('public', 'images', 'test.png')), filename: 'test.png', content_type: 'image/png') }
    # end
  end
end
