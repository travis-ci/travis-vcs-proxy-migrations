class CreateWebhooks < ActiveRecord::Migration[6.1]
  def change
    create_table :webhooks do |t|
      t.references :repository
      t.string :name
      t.string :url
      t.boolean :active
      t.boolean :insecure_ssl
      t.timestamps
    end

    add_foreign_key :webhooks, :repositories
  end
end
