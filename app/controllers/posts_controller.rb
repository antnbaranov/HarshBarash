class PostsController < ApplicationController
  before_action :set_post, only:  :show

  def index
    @posts = Post.all
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end


end
