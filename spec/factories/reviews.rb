FactoryGirl.define do
  factory :review do
    rating 5
    body "Great podcast!"

    user
    podcast
  end
end