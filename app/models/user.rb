class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_person_name

  has_many :posts, dependent: :destroy

  # validates :first_name, length: { minimum: 2, maximum: 30 }
  # validates :last_name, length: { minimum: 2, maximum: 30 }
  # validates :email, length: { minimum: 8, maximum: 50 }
  # validates :phone_number, length: { minimum: 10, maximum: 15 }

  def attributes
    super.yield_self { |attrs| attrs.dup.merge('name' => name) }
  end
end
