# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password { 'B@rong2018' }
    password_confirmation { 'B@rong2018' }
    state { 'active' }

    # trait :with_profile do
    #   after(:create) do |account, _|
    #     create(:profile, user: user)
    #   end
    # end
  end
end
