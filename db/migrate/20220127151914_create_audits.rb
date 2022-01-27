class CreateAudits < ActiveRecord::Migration[6.1]
  def change
    create_table :audits do |t|

      t.datetime :created_at, null: false
      t.integer :owner_id, null: false
      t.string :owner_type, null: false
      t.string :updates, null: false
    end
  end
end
