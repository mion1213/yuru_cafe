class Public::PostTagRelationsController < ApplicationController
  
  belongs_to :post
  belongs_to :tag

end
