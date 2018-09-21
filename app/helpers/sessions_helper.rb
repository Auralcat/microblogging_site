module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    puts "Session created: #{session}"
  end

  def log_out
    reset_session
    @current_user = nil
  end

  # Returns the currently logged-in user (if any)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user.nil?
  end
end
