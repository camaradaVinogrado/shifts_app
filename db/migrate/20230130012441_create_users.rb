# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 64, null: false
      t.string :last_name, limit: 64, null: false
      t.string :email, null: false

      t.index :email, unique: true
      t.timestamps
    end
  end
end
