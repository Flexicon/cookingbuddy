# frozen_string_literal: true

class AddUniqueIndexToRecipes < ActiveRecord::Migration[8.0]
  def change
    add_index :recipes, :name, unique: true
  end
end
