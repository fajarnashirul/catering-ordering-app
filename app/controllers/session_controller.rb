class SessionController < ApplicationController
  include SessionHelper
  
  def new
    session[:referrer] = request.referer
  end

  def create
     user = User.find_by(email: params[:session][:email].downcase)
    
    # if user && user.authenticate(params[:session][:password])
    if user.present? && params[:session][:password] == user.password
        log_in user
      if current_user.role == 'admin'
        redirect_to admin_path
      else
        redirect_to user_path(session[:user_id])
      end
       else
      flash.now[:danger] = "Invalid email/password confirmation"
      render "new"
    end
  end

  def logout
    log_out
  end
end
