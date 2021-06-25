class CreateServerProviderUserSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :server_provider_user_settings do |t|
      t.string :username, null: false
      t.string :value, null: false
      t.integer :server_provider_user_id, null: false
      t.boolean :is_syncing
    end

    add_foreign_key :server_provider_user_settings, :server_provider_permissions, column: :server_provider_user_id
    add_index :server_provider_user_settings, :server_provider_user_id
  end
end
