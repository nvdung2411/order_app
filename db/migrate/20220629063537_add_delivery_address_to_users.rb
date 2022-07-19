class AddDeliveryAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :delivery_address, :string
  end
end
