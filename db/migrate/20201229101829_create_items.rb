class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :payment_for_shipping_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :number_of_day_id, null: false
      t.integer :price, null: false
      t.timestamps
      t.integer :user_id, foreign_key: true
    end
  end
end
