class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    bookmarks = Bookmark.where(user_id: user.id).pluck(:post_id)
    @bookmarks = Post.find(bookmarks)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :postal_code, :telephone_number, :introduction)
  end
  
end
