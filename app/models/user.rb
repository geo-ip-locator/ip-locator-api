class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :ip_addresses, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: { message: 'user already exists' }
end
