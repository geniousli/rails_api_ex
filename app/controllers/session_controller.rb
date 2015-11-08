class SessionController < ApplicationController

  def create
    # @user = User.find_by_email(session_params[:email])
    # if @user && !@user.authenticate(session_params[:password])
    # end
  end

  def destroy
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
