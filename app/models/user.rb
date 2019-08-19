class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :posts, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  def full_name
    return "#{first_name} #{last_name}" if first_name && last_name
    'Bruce Wayne'
  end
end
