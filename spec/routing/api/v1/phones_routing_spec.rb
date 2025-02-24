require "rails_helper"

RSpec.describe Api::V1::PhonesController, type: :routing do
  describe "rotas para Phones" do
    it "rota GET /api/v1/phones/:id direciona para api/v1/phones#show" do
      expect(get: "/api/v1/phones/1").to route_to("api/v1/phones#show", id: "1", format: :json)
    end

    it "rota POST /api/v1/contacts/:contact_id/phones direciona para api/v1/phones#create" do
      expect(post: "/api/v1/contacts/1/phones").to route_to("api/v1/phones#create", contact_id: "1", format: :json)
    end
  end
end
