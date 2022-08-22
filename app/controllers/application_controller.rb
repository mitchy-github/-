class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_q_for_room

    def set_q_for_room
        @q_header = Room.ransack(params[:q])
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:full_name])
    end
    
    def after_sign_in_path_for(resource)
        users_index_path
    end 
  
end
