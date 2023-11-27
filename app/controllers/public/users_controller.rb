class Public::UsersController < ApplicationController
  
  def show
    @user = User.find(current_user.id)
    bookmarks = Bookmark.where(user_id: current_user.id).pluck(:post_id)
    @bookmarks = Post.find(bookmarks)
  end
  
end
