class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :access_key
      t.string :name

      t.timestamps null: false
    end
    add_index :tenants, :access_key, unique: true
    add_index :tenants, :name, unique: true
  end
end
