class PostsController < ApplicationController
	def index
  @posts = Post.all
end
 
  def new
  @post = Post.new
end
 
def create
  @post = Post.new(params[:post].permit(:title, :text))
 
  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end

def update
  @post = Post.find(params[:id])
 
  if @post.update(params[:post].permit(:title, :text))
    redirect_to @post
  else
    render 'edit'
  end
end
 
private
  def post_params
    params.require(:post).permit(:title, :text)
  end

  def show
  @post = Post.find(params[:id])
end

end
