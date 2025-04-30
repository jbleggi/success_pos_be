# spec/support/auth_helpers.rb
module AuthHelpers
  def auth_headers(user = nil)
    user ||= FactoryBot.create(:user, :staff)
    token = JwtService.encode(user_id: user.id)
    { 'Authorization' => "Bearer #{token}" }
  end
end
