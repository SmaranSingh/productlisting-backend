class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.references :product, foreign_key: true, index: { unique: true }
      t.integer :quantity

      t.timestamps
    end
  end
end
