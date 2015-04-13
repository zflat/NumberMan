class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.string :prefix
      t.string :descriptor, null: false
      t.integer :width, null: false
      t.string  :alphabet
      t.references :tenant, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
