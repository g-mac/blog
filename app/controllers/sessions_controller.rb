class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      if URI(request.referrer).path == log_in_path || URI(request.referrer).path == sign_up_path
        redirect_to root_url #, :notice => 'Logged out!'
      else
        redirect_to request.referrer #, :notice => 'Logged in!'
      end
    else
      # flash.now.alert = 'Invalid email or password'
      redirect_to log_in_path, :notice => 'Invalid email or password!'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url #, :notice => 'Logged out!'
  end

end
