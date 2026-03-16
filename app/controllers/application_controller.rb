class ApplicationController < ActionController::Base
  before_action :load_current_user

  helper_method :current_user

  def load_current_user
    if session["user_id"]
      @current_user = User.find_by({ "id" => session["user_id"] })
    else
      @current_user = nil
    end
  end

  def current_user
    @current_user
  end
end