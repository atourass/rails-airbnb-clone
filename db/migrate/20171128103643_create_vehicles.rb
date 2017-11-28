class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.boolean :availability
      t.integer :kms
      t.string :brand
      t.string :model
      t.text :description
      t.integer :cc
      t.string :photo

      t.timestamps
    end
  end
end
