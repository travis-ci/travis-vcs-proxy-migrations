class CreateServerProviderPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :server_provider_permissions do |t|
      t.integer :user_id, null: false
      t.integer :server_provider_id, null: false
      t.integer :permission, null: false
    end

    add_foreign_key :server_provider_permissions, :users
    add_foreign_key :server_provider_permissions, :server_providers

    add_index :server_provider_permissions, :user_id
    add_index :server_provider_permissions, :server_provider_id
  end
end
