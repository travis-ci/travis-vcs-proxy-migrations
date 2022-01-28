class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false, limit: 255
      t.string :description
      t.string :listener_token, null: false
    end

    add_index :organizations, [:name], unique: true
  end
end
