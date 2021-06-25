class CreateOauthApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :oauth_applications do |t|
      t.string :name, null: false
      t.string :uuid, null: false
      t.string :secret, null: false
      t.string :redirect_uri, null: false
      t.integer :owner_id
    end

    add_foreign_key :oauth_applications, :users, column: :owner_id
  end
end
