require 'rails_helper'

RSpec.describe Api::V1::ContactsController, type: :controller do
  let(:user) { create :user }
  let(:kind) { create :kind }
  let(:phone) { create :phone }
  let(:address) { create :address }
  let(:contact) { create :contact, user: user, kind: kind, address: address, phones: [ phone ] }
  let(:contact_two) { create :contact, user: create(:user), kind: kind }

  let(:valid_headers) do
    user.create_new_auth_token.merge({ 'Accept' => 'application/json' })
  end

  let(:invalid_headers) do
    { 'Accept' => 'application/json' }
  end

  # def json_response
  #   JSON.parse(response.body)
  # end

  describe 'Get /index' do
    it 'returns a success response for json status 200' do
      request.headers.merge!(valid_headers)
      get :index
      expect(response).to be_successful
    end

    it 'returns a success response for json status 401' do
      request.headers.merge!(invalid_headers)
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

    it 'renders only contacts from logged user' do
      contact
      contact_two

      request.headers.merge!(valid_headers)
      get :index, as: :json

      # puts "Response body: #{response.body.inspect}"

      unless response.body.empty?
        parsed_response = JSON.parse(response.body)

        expect(json_response).not_to be_nil
        expect(json_response['data']).not_to be_empty
        expect(json_response['data'].size).to eq 1
        expect(json_response['data'][0]['id']).to eq contact.id
      else
        fail "Response body is empty - Check if your Jbuilder template exists"
      end
    end

    describe 'GET /show' do
      it 'renders a successful response' do
      request.headers.merge!(valid_headers)
      get :show, params: { id: contact.id }
      expect(response).to be_successful
    end

      it_behaves_like "trying to access another user's resource" do
        let(:url) do
          get api_article_url(article_two), headers: valid_headers, as: :json
        end
      end

      # it_behaves_like 'user not logged in' do
      #   let(:url) do
      #     get api_article_url(article), headers: invalid_headers, as: :json
      #   end
      # end
    end












    # it 'returns a request not acceptable for xml status 406' do
    # #  request.headers['Accept'] = 'application/xml'  # Formato não suportado
    #   get :index
    #   expect(response).to have_http_status(:not_acceptable)
    # end

    # it 'retorna apenas os contatos do usuário autenticado' do
    #   request.headers['Accept'] = 'application/json'
    #   get 'api/v1/contacts/index'

    #   puts @auth_headers
    #   puts "Response status: #{response.status}"
    #   puts "Response body: #{response.body}"  # Adiciona depuração para verificar o corpo da resposta

    #   json_response = JSON.parse(response.body) rescue { 'data' => [] }
    #   puts "Parsed JSON response: #{json_response}"  # Adiciona depuração para verificar o JSON parseado
    #   expect(json_response['data']).not_to be_empty

    # expect(json_response['contacts']).not_to be_empty
    # expect(json_response['data']).not_to be_empty
    #  expect(response.body).not_to be_empty # Verifica se a resposta não está vazia

    # expect(json_response['data'].size).to eq(contacts.size)
    # # expect(json_response['data'].size).to eq(1)
    # contact_ids = contacts.map(&:id)
    # json_ids = json_response['data'].map { |contact| contact['id'] }
    # expect(json_ids).to match_array(contact_ids)
    # end
  end
end
# let!(:contacts) { create_list(:contact, 1, user: user, kind: kind) }  # Cria uma lista de contatos
# let(:contact) { contacts.first }
# before do
#   @auth_headers = user.create_new_auth_token  # Cria os headers de autenticação
#   request.headers.merge!(@auth_headers)       # Adiciona os headers na requisição
#    puts "Headers de autenticação: #{@auth_headers}"
#    puts "Usuário criado: #{user.id} - #{user.email}"
#    puts "Contatos criados: #{Contact.pluck(:id, :user_id)}"
# end
