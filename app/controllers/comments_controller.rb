class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.build(comment_params)
    @comment.user_id = current_user.id
		
    if @comment.save
      redirect_to :back, notice: "Comment has been created"
    else
      redirect_to :back, notice: "Comment has't created"
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to :back, notice: "Comment has been deleted"
  end

	private

  def comment_params
    params.require(:comment).permit(:rating, :text)
  end
end
