class CreatePrefixes < ActiveRecord::Migration
  def change
    create_table :prefixes do |t|
      t.string :value
      t.references :tenant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
