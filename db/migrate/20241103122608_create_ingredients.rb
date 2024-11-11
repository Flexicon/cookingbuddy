# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.integer :amount, null: false
      t.string :unit
      t.references :recipe, index: true, null: false, foreign_key: true
      t.references :product, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
