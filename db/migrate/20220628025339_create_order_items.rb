class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :total
      t.integer :unit_price

      t.timestamps
    end
  end
end
