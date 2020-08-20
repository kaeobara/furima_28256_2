FactoryBot.define do

  factory :user do
    first_name            {"佳かカ"}
    first_name_kana       {"カタカナ"}
    family_name             {"佳かカ"}
    family_name_kana        {"カタカナ"}
    nickname              {"佳かカka"}
    birth_day             {"2020-10-10"}
    email                 {"kkk@email.com"}
    password              {"000ppp"}
    password_confirmation {password}
  end
end