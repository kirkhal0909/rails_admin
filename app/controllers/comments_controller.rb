class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = PostComment.new(params_comment)

    if @comment.save
      redirect_to @post
    else
      render json: { message: 'comment not created' }, status: :unprocessable_entity
    end
  end

  private

  def params_comment
    params.require(:post_comment).permit(:content).merge(user: current_user, post_id: params[:post_id])
  end

  def find_post
    @post = Post.find_by(id: params[:post_id])
    render json: { code: 404, message: 'post not found' }, status: 404 unless @post
  end
end
