class Tag < ApplicationRecord
  validates :name, presence: true, length: { maximum:99}
  has_many :post_tag_relations
  has_many :posts, through: :post_tag_relations
end
