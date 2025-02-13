require 'rails_helper'

RSpec.describe Api::V1::ContactsController, type: :controller do
  let(:user) { create(:user) }
  let(:contact) { create(:contact, user: user) }
  let(:headers) do
    {
      'ACCEPT' => 'application/json',
      'CONTENT_TYPE' => 'application/json',
      'Authorization' => "Bearer #{user.create_new_auth_token['access-token']}"
    }
  end

  describe 'GET #index' do
    it 'retorna todos os contatos do usuário logado' do
      # Crie alguns contatos para o usuário
      create(user: user)
      # Faça a requisição com o usuário logado
      get :index, headers: headers
      
      # Verifique se a resposta foi bem-sucedida
      expect(response).to have_http_status(:success)
      
      # Verifique se a resposta contém os contatos do usuário logado
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

 ##################################################
  # before do
  #   sign_in user
  # end

  # describe "GET #index" do
  #   it "returns a success response" do
  #     get :index
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #show" do
  #   it "returns a success response" do
  #     get :show, params: { id: contact.to_param }
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Contact" do
  #       expect {
  #         post :create, params: { contact: attributes_for(:contact) }
  #       }.to change(Contact, :count).by(1)
  #     end

  #     it "renders a JSON response with the new contact" do
  #       post :create, params: { contact: attributes_for(:contact) }
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to eq('application/json; charset=utf-8')
  #     end
  #   end

  #   context "with invalid params" do
  #     it "renders a JSON response with errors for the new contact" do
  #       post :create, params: { contact: attributes_for(:contact, name: nil) }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json; charset=utf-8')
  #     end
  #   end
  # end
end