class AddReservation2EndToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservation2_end, :date
  end
end
