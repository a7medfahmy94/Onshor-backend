FactoryGirl.define do
  factory :user do
    gcm_registration_id 1
    device_id 1
    number_of_shares 1
    number_of_ignores 1
    radius 1.5
  end
end
