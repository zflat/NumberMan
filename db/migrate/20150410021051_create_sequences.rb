class CreateSequences < ActiveRecord::Migration
  def change
    create_table :sequences do |t|
      t.string :prefix
      t.string :descriptor
      t.integer :width
      t.string  :alphabet
      t.references :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
