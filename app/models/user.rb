class User < ApplicationRecord
  
  has_many :rooms
  has_many :reservations
  has_one_attached :avatar
  
  with_options on: :step do
    validates :full_name, presence: true, on: :update
    validates :avatar, presence: true, on: :update
    validates :about, presence: true, on: :update
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
