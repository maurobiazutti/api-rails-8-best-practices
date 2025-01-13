class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show update destroy ]

  # GET /contacts
  def index
    @contacts = Contact.all

    render json: @contacts
  end

  # GET /contacts/1
  def show
    render json: @contact, include: [ kind: { only: :description }, phones: { only: [ :id, :number] }, address: { only: [ :id, :street, :city ] } ]
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
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
      @contact = Contact.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.expect(contact: [ 
                              :name,
                              :email,
                              :birthdate,
                              :kind_id,
                              phones_attributes: [ [
                                :id,
                                :number,
                                :_destroy  ] ],
                              address_attributes: [ [
                                :id,
                                :street,
                                :city,
                                :contact_id
                              ] ] ])
    end
end
