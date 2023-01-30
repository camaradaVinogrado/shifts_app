# frozen_string_literal: true

class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.datetime :start, null: false
      t.datetime :finish, null: false
      t.references :user, null: false, foreign_key: true

      t.index [:user_id, :start, :finish], unique: true
      t.timestamps
    end
  end
end
