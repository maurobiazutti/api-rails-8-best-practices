require 'rails_helper'

RSpec.describe "Api::V1::Contacts", type: :request do
  describe "GET /api/v1/contacts" do
    it "returns http success" do
      get "/api/v1/contacts"
      expect(response).to have_http_status(:success)
    end
  end
end
