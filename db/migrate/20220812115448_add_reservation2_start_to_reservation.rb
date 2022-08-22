class AddReservation2StartToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservation2_start, :date
  end
end
