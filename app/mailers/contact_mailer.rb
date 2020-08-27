class ContactMailer < ApplicationMailer
  def welcome
    @contact = params[:contact]
    mail(to: @contact.email, subject: "Olá, muito bem vindo !")
  end
  
end
