module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
    current_user
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def check_admin
    if current_user.role = 'admin'
      true
    else
      redirect_to root_path
    end
  end
end
