class CreateRepositoryPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :repository_permissions do |t|
      t.integer :user_id, null: false
      t.integer :repository_id, null: false
      t.integer :permission, null: false
    end

    add_foreign_key :repository_permissions, :users
    add_foreign_key :repository_permissions, :repositories
    add_index :repository_permissions, :user_id
    add_index :repository_permissions, :repository_id
  end
end
