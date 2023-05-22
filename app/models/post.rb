class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, class_name: 'PostLike'
  has_many :comments, class_name: 'PostComment'
end
