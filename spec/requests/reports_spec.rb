# spec/requests/reports_spec.rb
require 'rails_helper'

RSpec.describe "Reports", type: :request do
  let!(:user) { create(:user, :staff) }

  describe "GET /reports" do
    context "with valid JWT token" do
      it "returns a list of reports" do
        get "/reports", headers: auth_headers(user)
        expect(response).to have_http_status(:ok)
      end
    end

    context "with no token" do
      it "returns unauthorized" do
        get "/reports"
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "with invalid token" do
      it "returns unauthorized" do
        get "/reports", headers: { 'Authorization' => 'Bearer badtoken' }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
