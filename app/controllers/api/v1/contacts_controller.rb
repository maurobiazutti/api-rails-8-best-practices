class Api::V1::ContactsController < ApplicationController
  before_action :authenticate_api_user!
  before_action :set_contact, only: %i[ show update destroy ]
  include Paginable

  # GET /contacts
  def index
    @contacts = current_api_user.contacts.page(current_page).per(per_page)
    # puts "Contacts: #{@contacts.inspect}"
    # render json: @contacts, status: :ok
    # render 'api/v1/contacts/index.json.jbuilder', status: :ok
  end
  # GET /contacts/1
  def show
  end

  # POST /contacts
  def create
    @contact = current_api_user.contacts.new(contact_params)

    if @contact.save
      render json: @contact, status: :created
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
                              ] ])
    end
end
