class Picture < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :image, presence: true
end
