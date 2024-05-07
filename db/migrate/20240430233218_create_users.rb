# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def up
    rename_table :users, :sellers

    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_number, null: false
      t.string :userable_type, null: false
      t.integer :userable_id, null: false
      t.timestamps
    end

    change_table :sellers do |t|
      t.string :document, null: false
    end

    create_table :buyers do |t|
      t.string :document, null: false
    end

    add_index :users, %i[userable_type userable_id], unique: true
  end
end
