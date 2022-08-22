class AddRoomAddressToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :room_address, :text
  end
end
