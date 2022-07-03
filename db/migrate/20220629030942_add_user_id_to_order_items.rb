class AddUserIdToOrderItems < ActiveRecord::Migration[6.0]
  def change
    add_column :order_items, :user_id, :integer
  end
end
