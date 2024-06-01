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

      context 'when status is not included in the list' do
        it 'is invalid' do
          store = build(:store, status: 'whatever')
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
        store = build(:store, email: 'teste@store.com', phone_number: '(11) 94002-8922', status: STORE::STATUS.first, seller: create(:seller))
        store.valid?

        expect(store.errors).to be_empty
      end
    end
  end

  describe 'attachments' do # rubocop:disable Metrics/BlockLength
    context 'when uploading files' do
      context 'when logo' do
        it 'has a logo url' do
          logo = File.open(Rails.root.join('spec', 'fixtures', 'files', 'square500.png'))
          store = create(:store, logo:)

          expect(store.logo_url).to be_present
        end
      end

      context 'when banner' do
        it 'has a banner url' do
          banner = File.open(Rails.root.join('spec', 'fixtures', 'files', 'square500.png'))
          store = create(:store, banner:)

          expect(store.banner_url).to be_present
        end
      end

      context 'when favicon' do
        it 'has a favicon url' do
          favicon = File.open(Rails.root.join('spec', 'fixtures', 'files', 'square192.png'))
          store = create(:store, favicon:)

          expect(store.favicon_url).to be_present
        end
      end
    end

    context 'when not uploading files' do
      it 'not has a logo url' do
        store = create(:store)

        expect(store.logo_url).to be_nil
      end

      it 'not has a banner url' do
        store = create(:store)

        expect(store.banner_url).to be_nil
      end

      it 'not has a favicon url' do
        store = create(:store)

        expect(store.favicon_url).to be_nil
      end
    end

    context 'when deleting files' do
      it 'not has a logo url' do
        store = create(:store, logo: File.open(Rails.root.join('spec', 'fixtures', 'files', 'square500.png')))
        store.logo = nil

        expect(store.logo_url).to be_nil
      end

      it 'not has a banner url' do
        store = create(:store, banner: File.open(Rails.root.join('spec', 'fixtures', 'files', 'square500.png')))
        store.banner = nil

        expect(store.banner_url).to be_nil
      end

      it 'not has a favicon url' do
        store = create(:store, favicon: File.open(Rails.root.join('spec', 'fixtures', 'files', 'square192.png')))
        store.favicon = nil

        expect(store.favicon_url).to be_nil
      end
    end
  end
end
