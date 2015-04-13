class CreateNumbers < ActiveRecord::Migration
  def change
    create_table :numbers do |t|
      t.string :value
      t.references :tenant, index: true, foreign_key: true
      t.references :sequence, index: true, foreign_key: true
      t.string :descriptor

      t.timestamps null: false
    end
    add_index :numbers, :value
  end
end
