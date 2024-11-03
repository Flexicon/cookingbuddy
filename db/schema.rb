# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_11_03_122608) do
  create_table "ingredients", force: :cascade do |t|
    t.integer "amount", null: false
    t.string "unit"
    t.integer "recipe_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_ingredients_on_product_id"
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_products_on_category"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "category", null: false
    t.integer "protein_id"
    t.integer "carbohydrate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carbohydrate_id"], name: "index_recipes_on_carbohydrate_id"
    t.index ["category"], name: "index_recipes_on_category"
    t.index ["protein_id"], name: "index_recipes_on_protein_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ingredients", "products"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "recipes", "products", column: "carbohydrate_id"
  add_foreign_key "recipes", "products", column: "protein_id"
end
