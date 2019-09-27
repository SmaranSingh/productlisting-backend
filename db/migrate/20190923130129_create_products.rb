class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image, null: true
      t.string :category, null: false, default: "undefined"
      t.string :sub_category, null: false, default: "undefined"

      t.timestamps
    end
  end
end
