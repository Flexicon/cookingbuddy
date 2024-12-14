# frozen_string_literal: true

class AddUniqueIndexToProducts < ActiveRecord::Migration[8.0]
  def change
    add_index :products, :name, unique: true
  end
end
