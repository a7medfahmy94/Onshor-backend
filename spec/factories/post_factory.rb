FactoryGirl.define do
  factory :post do
    content "Hello, I need help"
    number_of_shares 1
    number_of_ignores 1
    user
  end
end
