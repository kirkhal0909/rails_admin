class PostLike < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_uniqueness_of :user_id, scope: %i[post_id user_id]
end
