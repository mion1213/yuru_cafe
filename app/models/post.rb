class Post < ApplicationRecord
  
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # DBへのコミット直前に実施する
  after_create do
    post = Post.find_by(id: self.id)
    tags  = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    post.tags = []
    tags.uniq.map do |tag|
    # ハッシュタグは先頭の'#'を外した上で保存
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      post.tags << tag
    end
  end

  before_update do 
    post = Post.find_by(id: self.id)
    post.tags.clear
    tags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |tag|
      tag = Tag.find_or_create_by(name: tag.downcase.delete('#'))
      post.tags << tag
    end
  end
  
  def find_bookmark(user)
    bookmarks.find_by(user_id: user.id)
  end
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
