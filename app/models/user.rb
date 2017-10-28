class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 30 }

  def user?
  	!self.admin?
  end
end
