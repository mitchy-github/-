class AddReservationEndToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservation_end, :datetime
  end
end
