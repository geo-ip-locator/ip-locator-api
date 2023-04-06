class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :ip_addresses, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: { message: 'user already exists' }
end
