# frozen_string_literal: true

class RemoveProteinCarbohydrateColumns < ActiveRecord::Migration[8.0]
  def change
    remove_reference :recipes, :protein, foreign_key: { to_table: :products }, if_exists: true
    remove_reference :recipes, :carbohydrate, foreign_key: { to_table: :products }, if_exists: true
  end
end
