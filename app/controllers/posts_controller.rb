class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
    else
      render :new
    end
  end

  def edit
    find_post
  end

  def update
    find_post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
    find_post
  end

  def likes
    find_post
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end
end
