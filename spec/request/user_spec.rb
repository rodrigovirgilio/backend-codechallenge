require "rails_helper"

RSpec.describe "Api::V1::Users", type: :request do
  describe "POST /create" do
    let(:user) { create(:user) }
    let(:authentication) { create(:authentication) }

    context "with valid parameters" do
      let(:user_params) do
        {
          first_name: user.first_name,
          last_name: user.last_name
        }
      end

      before do
        post "/api/v1/users",
          params: user_params, headers: { Authorization: authentication.token }
      end

      it "returns a created status" do
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      let(:user_params) do
        {
          first_name: nil,
          last_name: nil
        }
      end

      before do
        post "/api/v1/users",
          params: user_params, headers: { Authorization: authentication.token }
      end

      it "returns an unprocessable entity status" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "when authentication token is not valid" do
    let(:user) { create(:user) }

    let(:user_params) do
      {
        first_name: user.first_name,
        last_name: user.last_name
      }
    end

    it "invalid token" do
      post "/api/v1/users",
        params: user_params, headers: { Authorization: "1234" }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
