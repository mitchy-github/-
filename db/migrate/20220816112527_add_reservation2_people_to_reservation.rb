class AddReservation2PeopleToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :reservation2_people, :bigint
  end
end
