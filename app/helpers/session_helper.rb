module SessionHelper
  def check_login
    if current_user == nil
      redirect_to login_path, notice: "You need to login first."
    end
  end
  
  def log_in(user)
    session[:user_id] = user.id
    current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def check_admin
    if current_user.role == 'admin'
      true
    else
      false
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user == nil
    redirect_to login_path, notice: "You have successfully logged out."
  end
end
