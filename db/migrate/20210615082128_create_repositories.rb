class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :name, null: false
      t.string :display_name, null: false
      t.integer :created_by, null: false
      t.string :url, null: false
      t.integer :owner_id, null: false
      t.string :owner_type, null: false
      t.string :server_type, null: false
      t.datetime :last_synced_at
      t.string :listener_token, null: false
    end

    add_index :repositories, [:owner_id, :name], unique: true
  end
end
