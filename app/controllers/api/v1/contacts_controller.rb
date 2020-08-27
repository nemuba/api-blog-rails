module Api
  module V1
    class ContactsController < ApiController
      def create
        @contact = Contact.new(contact_params)

        if @contact.save
          ContactMailer.with(contact: @contact).welcome.deliver_later
          render json: @contact, status: :created
        else
          render json: @contact.errors.full_messages
        end
      end

      private

      def contact_params
        params.require(:contact).permit(:email)
      end
    end
  end
end