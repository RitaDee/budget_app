class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

         validates :name, presence: true
         has_many :categories, dependent: :destroy
         has_many ;deals, dependent: :destroy
end
