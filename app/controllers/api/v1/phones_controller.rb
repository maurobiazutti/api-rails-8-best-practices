module Api
  module V1
    class PhonesController < ApplicationController
      before_action :set_contact, only: [:create]
      before_action :set_phone, only: [:show, :update, :destroy]

      # GET /api/v1/phones/:id
      def show
        render json: @phone
      end

      # POST /api/v1/contacts/:contact_id/phones
      def create
        @phone = @contact.phones.build(phone_params)
        if @phone.save
          render json: @phone, status: :created
        else
          render json: { errors: @phone.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/phones/:id
      def update
        if @phone.update(phone_params)
          render json: @phone
        else
          render json: { errors: @phone.errors.full_messages }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/phones/:id
      def destroy
        @phone.destroy
        head :no_content
      end

      private

      def set_contact
        @contact = Contact.find(params[:contact_id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Contato não encontrado" }, status: :not_found
      end

      def set_phone
        @phone = Phone.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Telefone não encontrado" }, status: :not_found
      end

      def phone_params
        params.require(:phone).permit(:number)
      end
    end
  end
end
