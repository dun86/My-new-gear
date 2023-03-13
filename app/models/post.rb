class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :customer
  has_many :favorites, dependent: :destroy
  has_many_attached :images
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
  
end
