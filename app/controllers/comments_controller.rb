class CommentsController < ApplicationController
  def create
    # binding.pry
    @comment = Comment.new(user_id: params[:user_id], content: params[:content], movie_id: params[:movie_id])
    redirect_to(movie_path(params[:movie_id])) if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:movie_id, :user_id, :content)
  end
end
