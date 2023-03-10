class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :customer
end
