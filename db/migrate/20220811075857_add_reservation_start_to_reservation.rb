class AddReservationStartToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservation_start, :datetime
  end
end
