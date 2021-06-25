class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :server_provider_id, null: false
    end

    add_foreign_key :repositories, :server_providers
    add_index :repositories, [:server_provider_id, :name], unique: true
  end
end
