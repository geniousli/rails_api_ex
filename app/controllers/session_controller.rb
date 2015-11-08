class SessionController < ApplicationController

  skip_before_action :auth_user_token!, only: :create

  def create
    signin = User.find_by_name(session_params[:name])
    if signin && signin.authenticate(session_params[:password])
      render json: {name: signin.name, token: signin.encode_user}
    else
      render json: {state: "failed", error: "error"}
    end
  end

  def destroy
    current_user.regenerate_auth_token()
    current_user.save()
    render json: {state: "success", msg: "logout"}
  end

  private

  def session_params
    # params.require(:user).permit(:email, :password)
    # params.permit!
    {name: "lishaohua0", password: "11111111"}
  end
end
