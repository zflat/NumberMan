class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.string :value, null: false
      t.integer :decimal, null: false
      t.references :tenant, index: true, foreign_key: true, null: false
      t.references :sequence, index: true, foreign_key: true, null: false
      t.string :descriptor

      t.timestamps null: false
    end
    add_index :numbers, :value
  end
end
