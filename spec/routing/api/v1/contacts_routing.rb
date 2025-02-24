require "rails_helper"

RSpec.describe Api::V1::ContactsController, type: :routing do
  describe "rotas para API V1 Contacts" do
    it "rota GET /api/v1/contacts direciona para api/v1/contacts#index" do
      expect(get: "/api/v1/contacts").to route_to("api/v1/contacts#index", format: :json)
    end

    it "rota GET /api/v1/contacts/:id direciona para api/v1/contacts#show" do
      expect(get: "/api/v1/contacts/1").to route_to("api/v1/contacts#show", id: "1", format: :json)
    end

    it "rota POST /api/v1/contacts direciona para api/v1/contacts#create" do
      expect(post: "/api/v1/contacts").to route_to("api/v1/contacts#create", format: :json)
    end

    it "rota PUT /api/v1/contacts/:id direciona para api/v1/contacts#update" do
      expect(put: "/api/v1/contacts/1").to route_to("api/v1/contacts#update", id: "1", format: :json)
    end

    it "rota PATCH /api/v1/contacts/:id direciona para api/v1/contacts#update" do
      expect(patch: "/api/v1/contacts/1").to route_to("api/v1/contacts#update", id: "1", format: :json)
    end

    it "rota DELETE /api/v1/contacts/:id direciona para api/v1/contacts#destroy" do
      expect(delete: "/api/v1/contacts/1").to route_to("api/v1/contacts#destroy", id: "1", format: :json)
    end
  end
end
