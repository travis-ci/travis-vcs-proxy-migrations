class CreateRepositoryUserSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :repository_user_settings do |t|
      t.string :username, null: false
      t.string :value, null: false
      t.integer :repository_permission_id, null: false
      t.boolean :is_syncing
    end

    add_foreign_key :repository_user_settings, :repository_permissions, column: :repository_permission_id
    add_index :repository_user_settings, :repository_permission_id
  end
end
