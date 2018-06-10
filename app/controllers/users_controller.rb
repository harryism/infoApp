class UsersController < ApplicationController
  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @users = User.all
    if @user.save
      flash[:success] = "Signed up"
      redirect_to welcome_map_path
    else
      render 'new'
    end

  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :address, :message)
  end

end
