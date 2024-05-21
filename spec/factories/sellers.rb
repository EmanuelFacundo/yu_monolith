# frozen_string_literal: true

FactoryBot.define do
  factory :seller do
    email { 'seller@test.com' }
    password { 'Ab@341234' }
    document { '000.000.000-00' }
  end
end
