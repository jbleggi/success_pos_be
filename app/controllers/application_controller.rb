class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def current_user
    return unless request.headers["Authorization"]

    token = request.headers["Authorization"].split(" ").last
    decoded = JwtService.decode(token)
    @current_user ||= User.find_by(id: decoded[:user_id]) if decoded
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def authorize!
    render json: { error: "Not Authorized" }, status: :unauthorized unless current_user
  end
end
