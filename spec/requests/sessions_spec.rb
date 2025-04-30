# spec/requests/sessions_spec.rb
require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let!(:user) { create(:user, :staff, password: "password123") }

  it "logs in and returns a JWT token" do
    post "/login", params: { email: user.email, password: "password123" }

    expect(response).to have_http_status(:ok)
    expect(JSON.parse(response.body)).to have_key("token")
  end

  it "rejects invalid credentials" do
    post "/login", params: { email: user.email, password: "wrong" }

    expect(response).to have_http_status(:unauthorized)
  end
end
