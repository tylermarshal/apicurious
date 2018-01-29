class SessionsController < ApplicationController

  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    redirect_to dashboard
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil

    redirect_to root_path
  end

end
