class AddRoomPriceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :room_price, :number
  end
end
