# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    name { 'my store' }
    email { 'teste@store.com' }
    phone_number { '(11) 94002-8922' }

    association :seller

    trait :inactive do
      status { 'inactive' }
    end

    trait :active do
      status { 'active' }
    end

    trait :with_seller do
      seller { create(:seller) }
    end

    factory :store_with_seller, traits: %i[with_seller]
    factory :inactive_store, traits: %i[inactive]
    factory :active_store, traits: %i[active]
  end
end
