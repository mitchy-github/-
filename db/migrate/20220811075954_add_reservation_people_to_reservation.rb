class AddReservationPeopleToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservation_people, :Integer
  end
end
