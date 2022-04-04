class Partner < ApplicationRecord
  acts_as_token_authenticatable
  has_many :partner_proposals
  has_many :agreements
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
