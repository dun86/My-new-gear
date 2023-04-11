class PostComment < ApplicationRecord
  belongs_to :customer
  belongs_to :post
  validates :comment, presence: true
  paginates_per 10
end
