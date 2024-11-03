class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :category, null: false, index: true
      t.references :protein, index: true, foreign_key: {to_table: :products}
      t.references :carbohydrate, index: true, foreign_key: {to_table: :products}

      t.timestamps
    end
  end
end
