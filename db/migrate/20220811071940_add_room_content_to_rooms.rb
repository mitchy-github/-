class AddRoomContentToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :room_content, :text
  end
end
