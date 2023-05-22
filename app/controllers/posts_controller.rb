class PostsController < BaseController
  before_action :find_post, only: %i[show do_like]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render json: { message: 'post not created' }, status: :unprocessable_entity
    end
  end

  def show; end

  def do_like
    if liked?
      like.destroy
    else
      @post.likes.create(user: current_user)
    end

    redirect_to @post
  end

  private

  def find_post
    @post = Post.find_by(id: params[:id] || params[:post_id])
    render json: { code: 404, message: 'post not found' }, status: 404 unless @post
  end

  def post_params
    params.require(:post).permit(:content, :title).merge(user: current_user)
  end

  def comment_params
    params.require(:comment).permit(:content, :title).merge(user: current_user)
  end

  def liked?
    like.present?
  end

  def like
    @like ||= @post.likes.find_by(user_id: current_user&.id)
  end
end
