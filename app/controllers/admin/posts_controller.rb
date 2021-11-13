class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only:  [ :edit, :update, :destroy]


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to [:admin, @post], info: 'Статья обновлена'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end


end
