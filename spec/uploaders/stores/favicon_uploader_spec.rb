# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stores::FaviconUploader do # rubocop:disable Metrics/BlockLength
  describe 'Validate' do
    context 'when the file is not an image' do
      it 'returns an error' do
        file = file_fixture('text.txt').open
        store = build(:store, favicon: file)

        expect(store).to be_invalid
        expect(store.errors[:favicon].first).to include(I18n.t('errors.file.mime_type_inclusion', list: 'image/png, image/ico'))
      end
    end

    context 'when the file is not a png or ico' do
      it 'returns an error' do
        file = file_fixture('square192.jpg').open
        store = build(:store, favicon: file)

        expect(store).to be_invalid
        expect(store.errors[:favicon].first).to include(I18n.t('errors.file.extension_inclusion', list: 'png, ico'))
      end
    end

    context 'when the file size is greater than 1MB' do
      it 'returns an error' do
        file = file_fixture('square192.png').open

        allow(file).to receive(:size).and_return(2 * 1024 * 1024)

        store = build(:store, favicon: file)

        expect(store).to be_invalid
        expect(store.errors[:favicon].first).to include(I18n.t('errors.file.max_size', max: '1MB'))
      end
    end

    context 'when the file mime type is png or ico' do # rubocop:disable Metrics/BlockLength
      context 'when the file width is less or equal to 192px' do
        it 'returns valid' do
          file = file_fixture('square192.png').open

          store = build(:store, favicon: file)

          expect(store).to be_valid
          expect(store.errors[:favicon]).to be_empty
        end
      end

      context 'when the file width is greater or equal to 32px' do
        it 'returns valid' do
          file = file_fixture('square32.png').open

          store = build(:store, favicon: file)

          expect(store).to be_valid
          expect(store.errors[:favicon]).to be_empty
        end
      end

      context 'when the file height is less or equal to 192px' do
        it 'returns valid' do
          file = file_fixture('square192.png').open

          store = build(:store, favicon: file)

          expect(store).to be_valid
          expect(store.errors[:favicon]).to be_empty
        end
      end

      context 'when the file height is greater or equal to 32px' do
        it 'returns valid' do
          file = file_fixture('square32.png').open

          store = build(:store, favicon: file)

          expect(store).to be_valid
          expect(store.errors[:favicon]).to be_empty
        end
      end
    end
  end

  describe 'Derivatives' do
    context 'when the file is uploaded' do
      it 'creates the iphone derivative' do
        file = file_fixture('square192.png').open

        store = create(:store, favicon: file)

        expect(store.favicon_url(:iphone)).to be_present
      end

      it 'creates the ipad derivative' do
        file = file_fixture('square192.png').open

        store = create(:store, favicon: file)

        expect(store.favicon_url(:ipad)).to be_present
      end

      it 'creates the web derivative' do
        file = file_fixture('square192.png').open

        store = create(:store, favicon: file)

        expect(store.favicon_url(:web)).to be_present
      end

      it 'creates the android derivative' do
        file = file_fixture('square192.png').open

        store = create(:store, favicon: file)

        expect(store.favicon_url(:android)).to be_present
      end
    end
  end
end
