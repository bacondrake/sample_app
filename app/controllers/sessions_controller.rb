class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      # flash.now is used instead of flash because the now determines
      # that the message (string above) will be removed when another
      # request is sent (such as changing the page or refreshing).
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
