class Post < ApplicationRecord
  scope :created_at_desc, -> { order(created_at: :desc) }
  scope :created_at_asc, -> { order(created_at: :asc) }
  belongs_to :genre
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many_attached :images
  has_one_attached :video

  def favorited_by?(customer)
    if customer
      favorites.exists?(customer_id: customer.id)
    else
      false
    end
  end
end
