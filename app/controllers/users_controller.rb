class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user.password = params["password"]

    if @user.save
      redirect_to "/login"
    else
      flash["notice"] = @user.errors.full_messages.join(", ")
      redirect_to "/signup"
    end
  end
end