class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :picture

  validates :text, presence: true, length: { maximum: 140 }
  validates :rating, presence: true
end
