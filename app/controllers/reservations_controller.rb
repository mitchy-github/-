class ReservationsController < ApplicationController
  before_action :authenticate_user!
    
  def index
    @reservations = Reservation.where(user_id: current_user.id)
    @reservation = Reservation.new
    @room = @reservation.room
  end

  def confirm
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(params.permit(:reservation2_start, :reservation2_end, :start_date, :end_date, :reservation_start, :reservation_end, :reservation2_people, :reservation_price, :room_id, :user_id))
      if @reservation.valid?(:step2)
        @room = Room.find(@reservation.room_id)
        @user_id = current_user.id
        @days = (@reservation.reservation2_end - @reservation.reservation2_start).to_i
        @price = @days * @room.room3_price * @reservation.reservation2_people
      else
        @room = Room.find(@reservation.room_id)
        @user = User.find(@room.user_id)
        @user_id = current_user.id
        render template:"rooms/show"
      end
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:reservation2_start, :reservation2_end, :start_date, :end_date, :reservation_start, :reservation_end, :reservation2_people, :reservation_price, :room_id, :user_id))
    @room = Room.find(params[:reservation][:room_id])
    if @reservation.save
      redirect_to @reservation
    else
      render "confirm"
    end
  end

  def show
    @reservation = Reservation.new
    @room = @reservation.room
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end
end