module Api
  module V1
    class AddressesController < ApplicationController
      before_action :set_contact, only: [:create]
      before_action :set_address, only: [:show, :update, :destroy]

      # GET /api/v1/addresses/:id
      def show
        render json: @address
      end

      # POST /api/v1/contacts/:contact_id/addresses
      def create
        @address = @contact.build_address(address_params)  # Apenas 1 endereço por contato
        if @address.save
          render json: @address, status: :created
        else
          render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/addresses/:id
      def update
        if @address.update(address_params)
          render json: @address
        else
          render json: { errors: @address.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/addresses/:id
      def destroy
        @address.destroy
        head :no_content
      end

      private

      def set_contact
        @contact = Contact.find(params[:contact_id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Contato não encontrado" }, status: :not_found
      end

      def set_address
        @address = Address.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Endereço não encontrado" }, status: :not_found
      end

      def address_params
        params.require(:address).permit(:street, :city, :state, :zip_code)
      end
    end
  end
end
