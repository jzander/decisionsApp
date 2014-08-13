class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :email, type: String
  field :name, type: String
  field :password_digest, type: String
  field :is_active, type: Mongoid::Boolean, default: true

  has_secure_password

  has_many :decisions
  has_many :answers

  #has_many :answers
  
end
