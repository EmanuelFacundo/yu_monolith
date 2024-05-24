# frozen_string_literal: true

FactoryBot.define do
  factory :seller do
    email { "seller#{Random.random_number(1_000_000)}@test.com" }
    password { 'Ab@341234' }
    document { "000.000.000-0#{Random.random_number(1_000_000)}" }
  end
end
