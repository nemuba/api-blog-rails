class ContactMailer < ApplicationMailer
  def welcome
    @contact = params[:contact]
    mail(to: @contact.email, subject: "Bem muito bem vindo !")
  end
  
end
