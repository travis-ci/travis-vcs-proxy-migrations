class AddOrganizationInvitation < ActiveRecord::Migration[6.1]
  def change
    create_table :organization_invitations do |t|
      t.integer :user_id, null: false
      t.integer :organization_id, null: false
      t.integer :permission, null: false
      t.string :token, null: false
      t.datetime :created_at, null: false
    end

    add_index :organization_invitations, :token
  end
end
