class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user&.authenticate(params[:session][:password])
      log_in user
      redirect_to user # user_url(user)
    else
      flash[:danger] = t("static_pages.login.error_message")
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end