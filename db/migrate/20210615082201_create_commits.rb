class CreateCommits < ActiveRecord::Migration[6.1]
  def change
    create_table :commits do |t|
      t.string :sha, null: false
      t.integer :user_id, null: false
      t.integer :repository_id, null: false
      t.integer :ref_id, null: false
      t.datetime :created_at, null: false
    end

    add_foreign_key :commits, :users
    add_foreign_key :commits, :repositories
    add_foreign_key :commits, :refs
    add_index :commits, :user_id
    add_index :commits, :repository_id
    add_index :commits, :ref_id
  end
end
