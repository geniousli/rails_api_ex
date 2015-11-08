class ApplicationController < ActionController::API

  before_action :auth_user_token!

  rescue_from Exception, with: :with_exception

  private

  def auth_user_token!
    user = User.decode_token(request.headers.env["HTTP_HTTP_AUTHORIZATION"])
    if user
      self.current_user = user
    else
      raise "user not login"
    end
  end


  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user
  end

  def with_exception
    render json: {state: "failed", error: "nothing "}
  end
end
