class AddRoomNameToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :room_name, :text
  end
end
