class CreateServerProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :server_providers do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :type, null: false
      t.string :listener_token
    end

    add_index :server_providers, [:type, :url], unique: true
    add_index :server_providers, :listener_token, unique: true
  end
end
