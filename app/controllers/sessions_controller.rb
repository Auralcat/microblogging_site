class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # user is logged in
    else
      # Create an error message
      flash[:danger] = 'Invalid email/password combination.'
      render 'new'
    end
  end

  def destroy

  end
end
