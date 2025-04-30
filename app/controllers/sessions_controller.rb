# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def create
    user = User.authenticate(params[:email], params[:password])

    if user
      token = JwtService.encode({ user_id: user.id })
      render json: { token: token, user: user }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end
end
