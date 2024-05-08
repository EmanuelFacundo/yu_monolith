# frozen_string_literal: true

require 'rails_helper'

describe Seller, type: :model do
  describe 'Validates' do
    context 'when create valid seller' do
      context 'document is CPF' do
        it 'expected valid' do
          seller = build(:seller,
                         email: 'test@yu.com',
                         password: 'Ab@341234',
                         document: '000.000.000-00')

          expect(seller).to be_valid
        end
      end
      context 'document is CNPJ' do
        it 'expected valid' do
          seller = build(:seller,
                         email: 'test@yu.com',
                         password: 'Ab@341234',
                         document: '000.00.000/0000-00')

          expect(seller).to be_valid
        end
      end
    end
  end
end
