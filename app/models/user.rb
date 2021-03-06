class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :collaborators
  has_many :events
  has_many :colevents, through: :collaborators
  has_many :messages, through: :colevents
end
