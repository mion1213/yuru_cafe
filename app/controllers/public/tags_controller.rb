class Public::TagsController < ApplicationController
  
  has_many :post_tag_relations, dependent: :destroy
  has_many :posts, through: :post_tag_relations, dependent: :destroy

end
