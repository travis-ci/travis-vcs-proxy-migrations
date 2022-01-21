class CreateOrganizationPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :organization_permissions do |t|
      t.integer :user_id, null: false
      t.integer :organization_id, null: false
      t.integer :permission, null: false
    end

    add_foreign_key :organization_permissions, :users
    add_foreign_key :organization_permissions, :organizations

    add_index :organization_permissions, :user_id
    add_index :organization_permissions, :organization_id
  end
end
