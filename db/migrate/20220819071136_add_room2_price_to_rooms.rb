class AddRoom2PriceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :room2_price, :bigint
  end
end
