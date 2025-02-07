class Api::V2::ContactsController < ApplicationController
  ######################## AUTENTICATION BASIC ########################
  # To create a basic authentication
  # include ActionController::HttpAuthentication::Basic::ControllerMethods
  # http_basic_authenticate_with name: "mauro", password: "123456"
  ######################## AUTENTICATION BASIC ########################

  ######################## AUTENTICATION TOKEN ########################
  # To create a token authentication
  # TOKEN = "mauro123"
  # include ActionController::HttpAuthentication::Token::ControllerMethods
  # before_action :authenticate
  ######################## AUTENTICATION TOKEN ########################
  before_action :authenticate_api_user!
  before_action :set_contact, only: %i[ show update destroy ]
  include Paginable


  # GET /contacts
  def index
    @contacts = current_api_user.contacts.page(current_page).per(per_page)
    # @contacts = current_api_user.contacts.all
    

    # render json: @contacts, status: :ok
    # render json: @contacts #, include: [ kind: { only: :description }, phones: { only: [ :id, :number ] }, address: { only: [ :id, :street, :city ] } ]
  end
  # GET /contacts/1
  def show
    # render json: @contact #, include: [ kind: { only: :description }, phones: { only: [ :id, :number ] }, address: { only: [ :id, :street, :city ] } ]
  end

  # POST /contacts
  def create
    @contact = current_api_user.contacts.new(contact_params)

    if @contact.save
      render json: @contact, status: :created #, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = current_api_user.contacts.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.expect(contact: [
                              :name,
                              :email,
                              :birthdate,
                              :kind_id,
                              :user_id,
                              phones_attributes: [ [
                                :number,
                                :_destroy  ] ],
                              address_attributes: [
                                :street,
                                :city
                                # :contact_id
                              ] ])
    end

  ######################## AUTENTICATION TOKEN ########################
  # def authenticate
  #   authenticate_or_request_with_http_token do |token, options|
  #     ActiveSupport::SecurityUtils.secure_compare(
  #       ::Digest::SHA256.hexdigest(token),
  #       ::Digest::SHA256.hexdigest(TOKEN)
  #     )
  #   end
  # end
  ######################## AUTENTICATION TOKEN ########################
end
