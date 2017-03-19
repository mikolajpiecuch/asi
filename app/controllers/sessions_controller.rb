class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, flash: { success: "Logged in!" }
    else
        # render :new, flash: { danger: "invalid"}
        redirect_to root_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, flash: { success: "Logged out" }
  end
end
