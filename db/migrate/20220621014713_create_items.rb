class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :size
      t.text :description
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
