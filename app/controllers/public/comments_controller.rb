class Public::CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post = @post
    comment.save
    redirect_to post_path(post)
  end
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(params[:post_id])
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment)
  end
end

