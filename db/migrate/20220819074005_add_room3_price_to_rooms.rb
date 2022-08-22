class AddRoom3PriceToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :room3_price, :integer
  end
end
