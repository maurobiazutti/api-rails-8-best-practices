require "rails_helper"

RSpec.describe Api::V1::AddressesController, type: :routing do
  describe "rotas para Addresses" do
    it "rota GET /api/v1/addresses/:id direciona para api/v1/addresses#show" do
      expect(get: "/api/v1/addresses/1").to route_to("api/v1/addresses#show", id: "1", format: :json)
    end

    it "rota POST /api/v1/contacts/:contact_id/addresses direciona para api/v1/addresses#create" do
      expect(post: "/api/v1/contacts/1/addresses").to route_to("api/v1/addresses#create", contact_id: "1", format: :json)
    end
  end
end
