class CreateOauthAccessTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :oauth_access_tokens do |t|
      t.integer :resource_owner_id, null: false
      t.integer :application_id, null: false
      t.string :token
      t.string :refresh_token
      t.integer :expires_in
      t.datetime :created_at
      t.datetime :revoked_at
    end

    add_foreign_key :oauth_access_tokens, :users, column: :resource_owner_id
    add_foreign_key :oauth_access_tokens, :oauth_applications, column: :application_id
  end
end
