class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(create_params)

    if @comment.save
      redirect_to topics_path, success: 'NiceComment！'
    else
      redirect_to new_topic_comment_path, danger: 'BadComment'
    end
  end

  private
  def create_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end
end
