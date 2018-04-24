class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
    #Post.new
  end

  def create
    @post = current_user.posts.build(params.require(:post).permit(:title,:content))
    if @post.save
      redirect_to posts_path, :notice => "Post added."
    else
      render "new"
    end
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post].permit(:title,:content))
      redirect_to posts_path, :notice => "Update sucessful."
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Post deleted"
  end

end
