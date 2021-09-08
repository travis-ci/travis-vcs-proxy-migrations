class CreateSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :settings do |t|
      t.string     :var,    null: false
      t.text       :value
      t.references :target, null: false, polymorphic: true
      t.timestamps null: true
    end

    add_index :settings, [ :target_type, :target_id, :var ], unique: true
  end
end
