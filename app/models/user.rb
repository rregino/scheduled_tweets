# email:string
# password_digest:string --> you don't actually set the password_digest
# password:string virtual attribute
# password_confirmation: string virtual attribute


class User < ApplicationRecord
  has_many :twitter_accounts
  has_many :tweets
  
  has_secure_password #

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }

  validates_uniqueness_of :email
end
