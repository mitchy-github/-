class AddReservationPriceToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservation_price, :bigint
  end
end
