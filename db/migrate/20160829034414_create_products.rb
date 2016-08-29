class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :codename
      t.integer :quentity
      t.string :size
      t.decimal :price
      t.decimal :discount
      t.references :Category, foreign_key: true
      t.references :Brand, foreign_key: true
      t.references :Color, foreign_key: true

      t.timestamps
    end
  end
end
