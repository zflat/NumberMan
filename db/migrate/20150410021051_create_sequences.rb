class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.string :prefix
      t.string :delimiter
      t.string :descriptor, null: false
      t.integer :width, null: false
      t.string  :alphabet
      t.references :tenant, index: true, null: false #, foreign_key: true

      t.timestamps null: false
    end
  end
end
