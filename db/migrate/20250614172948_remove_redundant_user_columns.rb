# frozen_string_literal: true

class RemoveRedundantUserColumns < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :reset_password_sent_at, :string, if_exists: true
    remove_column :users, :reset_password_token, :string, if_exists: true
  end
end
