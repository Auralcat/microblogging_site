class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # You can call Byebug inside the view, it opens in the server's console
    # and halts the loading of the page until you press C-d.
    # debugger
  end
end
