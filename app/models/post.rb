class Post < ActiveRecord::Base

  belongs_to :user
  acts_as_followable
  validates :whoot, length: { maximum: 170 }
end
