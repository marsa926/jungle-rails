class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      flash[:notice] = "Welcome new user!"
      redirect_to '/'
    else
      redirect_to '/signup'
      flash[:notice] = "Email already exist or unmatched password!"
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :email_confirmation, :password, :password_confirmation)

  end

end
