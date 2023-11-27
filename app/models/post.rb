class Post < ApplicationRecord
  
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def find_bookmark(user)
    bookmarks.find_by(user_id: user.id)
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
