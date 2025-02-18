require 'rails_helper'

RSpec.describe Api::V1::ContactsController, type: :controller do
  let(:user) { create(:user) }
  let!(:contacts) { create(:contact, user: user) }
  let(:contact) { contacts.first }

  before do
    @auth_headers = user.create_new_auth_token  # Cria os headers de autenticação
    request.headers.merge!(@auth_headers)       # Adiciona os headers na requisição
  end
  describe 'Get #index' do
  it 'returns a success response for json status 200' do
    request.headers['Accept'] = 'application/json'
      # puts @auth_headers
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'returns a request not acceptable for xml status 406' do
     request.headers['Accept'] = 'application/xml'  # Formato não suportado
      get :index
      expect(response).to have_http_status(:not_acceptable)
    end

    it 'retorna apenas os contatos do usuário autenticado' do
      request.headers['Accept'] = 'application/json'

      get :index
      puts @auth_headers
      puts "Response status: #{response.status}"
      puts "Response body: #{response.body}"  # Adiciona depuração para verificar o corpo da resposta
      json_response = JSON.parse(response.body)
      expect(json_response.size).to eq(1)
    end
      # expect(json_response['data'].size).to eq(1)

      # # Verifica se todos os IDs correspondem aos contatos do usuário autenticado
      # contact_ids = contacts.map(&:id)
      # # json_ids = json_response.map { |contact| contact['id'] }
      # json_ids = json_response['data'].map { |contact| contact['id'] }
      # expect(json_ids).to match_array(contact_ids)
  end
end
