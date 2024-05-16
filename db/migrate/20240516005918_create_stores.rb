# frozen_string_literal: true

class CreateStores < ActiveRecord::Migration[7.1]
  def change # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    create_table :stores do |t|
      t.string :name
      t.string :status, null: false, default: 'inactive'
      t.jsonb :favicon_data
      t.jsonb :logo_data
      t.jsonb :banner_data
      t.string :instagram_slug
      t.string :facebook_slug
      t.string :tiktok_slug
      t.string :email
      t.string :phone_number
      t.string :seo_title
      t.text :meta_keywords
      t.text :meta_description

      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :stores, :user_id
  end
end
