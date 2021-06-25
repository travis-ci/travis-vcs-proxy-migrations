class CreatePullRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :pull_requests do |t|
      t.integer :base_id, null: false
      t.integer :head_id, null: false
      t.integer :repository_id, null: false
      t.integer :user_id, null: false
      t.datetime :created_at
      t.integer :number
    end

    add_foreign_key :pull_requests, :commits, column: :base_id
    add_foreign_key :pull_requests, :commits, column: :head_id
    add_foreign_key :pull_requests, :repositories
    add_foreign_key :pull_requests, :users
    add_index :pull_requests, :repository_id
    add_index :pull_requests, :user_id
  end
end
