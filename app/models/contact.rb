class Contact < ApplicationRecord
  validates :email, presence: true
  validates_uniqueness_of :email, message: "%{value} já foi cadastrado !"
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
