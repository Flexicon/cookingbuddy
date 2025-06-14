# frozen_string_literal: true

class AddUserProfileColumns < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :image_url, :string
  end
end
