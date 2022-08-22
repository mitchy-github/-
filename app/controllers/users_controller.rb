class UsersController < ApplicationController
  def dashboard
    @user = User.find(current_user.id)
    
  end
  
  def index
    @q = Room.ransack(params[:q])
    @results = @q.result(distinct: true)
  end
  
  def update
    @user = current_user
    if @user.valid?(:step) && @user.update_attributes(current_user_params)
      flash[:notice] = "保存しました"
      redirect_to dashboard_path
    else
      flash[:alert] = "更新できません"
    render "dashboard"
    end
  end  
  
  def show
    @user = User.find(current_user.id)
  end
  
  private
  
  def current_user_params
    params.require(:user).permit(:about, :status, :avatar, :full_name)
  end
end
