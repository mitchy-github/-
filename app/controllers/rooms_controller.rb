class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_q, only: [:index, :search]
  
  def index
     @rooms = current_user.rooms
  end
  
  def new
    @room = current_user.rooms.build
  end
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to rooms_path(@room), notice: "保存しました。"
    else
      flash[:alert] = "問題が発生しました。"
      render :new
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def update
    new_params = room_params
    if @room.update(new_params)
      flash[:notice] = "保存しました。"
    else
      flash[:alert] = "問題が発生しました。"
    end
    redirect_back(fallback_location: request.referer)
  end
  
  def search
    @results = @q.result(distinct: true)
    @results_count = @results.count
    if @q_header
    @results = @q_header.result(distinct: true)
    end
  end
  
  private

    def set_q
      @q = Room.ransack(params[:q])
    end

    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:room_name, :room_content, :room3_price, :room_address, :image, :room_image, :home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
    end
end
