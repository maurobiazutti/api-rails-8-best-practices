require "rails_helper"

RSpec.describe Api::V1::KindsController, type: :routing do
  describe "rotas para Kinds" do
    it "rota GET /api/v1/kinds direciona para api/v1/kinds#index" do
      expect(get: "/api/v1/kinds").to route_to("api/v1/kinds#index", format: :json)
    end

    it "rota GET /api/v1/kinds/:id direciona para api/v1/kinds#show" do
      expect(get: "/api/v1/kinds/1").to route_to("api/v1/kinds#show", id: "1", format: :json)
    end

    it "rota POST /api/v1/kinds direciona para api/v1/kinds#create" do
      expect(post: "/api/v1/kinds").to route_to("api/v1/kinds#create", format: :json)
    end

    it "rota PATCH /api/v1/kinds/:id direciona para api/v1/kinds#update" do
      expect(patch: "/api/v1/kinds/1").to route_to("api/v1/kinds#update", id: "1", format: :json)
    end

    it "rota PUT /api/v1/kinds/:id direciona para api/v1/kinds#update" do
      expect(put: "/api/v1/kinds/1").to route_to("api/v1/kinds#update", id: "1", format: :json)
    end

    it "rota DELETE /api/v1/kinds/:id direciona para api/v1/kinds#destroy" do
      expect(delete: "/api/v1/kinds/1").to route_to("api/v1/kinds#destroy", id: "1", format: :json)
    end
  end
end
