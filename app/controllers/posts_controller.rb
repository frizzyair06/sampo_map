class PostsController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @posts = Post.all
    @tags = Post.tag_counts_on(:tags).most_used(20)
  end
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    # アソシエーション
    post.user_id = current_user.id
    
    if post.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tag_counts_on(:tags)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to :action => "show", :id => post.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to action: :index
  end
  
  private
  def post_params
    params.require(:post).permit(:title,:detail,:image,:lat,:lng,:street_address,:tag_list)
  end
end