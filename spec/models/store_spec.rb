# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do # rubocop:disable Metrics/BlockLength
  describe 'validations' do # rubocop:disable Metrics/BlockLength
    context 'when exists invalid attributes' do # rubocop:disable Metrics/BlockLength
      context 'when status is not present' do
        it 'is invalid' do
          store = build(:store, status: nil)
          store.valid?

          expect(store.errors.first.attribute).to eq(:status)
        end
      end

      context 'when phone_number is not in the correct format' do
        it 'is invalid' do
          store = build(:store, phone_number: '123')
          store.valid?

          expect(store.errors.first.attribute).to eq(:phone_number)
        end
      end

      context 'when email is not in the correct format' do
        it 'is invalid' do
          store = build(:store, email: 'teste')
          store.valid?

          expect(store.errors.first.attribute).to eq(:email)
        end
      end

      context 'when seller is not present' do
        it 'is invalid' do
          store = build(:store, seller: nil)
          store.valid?

          expect(store.errors.first.attribute).to eq(:seller)
        end
      end
    end

    context 'when all attributes are valid' do
      it 'is valid' do
        store = build(:store, email: 'teste@store.com', phone_number: '(11) 94002-8922', status: 'active', seller: create(:seller))
        store.valid?

        expect(store.errors).to be_empty
      end
    end
  end
end
