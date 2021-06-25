class CreateServerProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :server_providers do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.string :type, null: false
      t.string :listener_token
    end
  end
end
