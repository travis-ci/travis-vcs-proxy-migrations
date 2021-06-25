class CreateRefs < ActiveRecord::Migration[6.1]
  def change
    create_table :refs do |t|
      t.string :name, null: false
      t.integer :type, null: false
      t.integer :repository_id, null: false
    end

    add_foreign_key :refs, :repositories
    add_index :refs, [:repository_id, :type, :name], unique: true
  end
end
