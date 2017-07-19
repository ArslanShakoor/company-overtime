class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = current_user.posts.page params[:page]
  end	

  def new
    @post = Post.new
  end	

  def create
    @post = Post.new(require_params)
    @post.user_id =  current_user.id
    
    if @post.save
      redirect_to  @post, notice: "your post was created successfully"
    else
      render "new"
    end    
  end	

  def show
    authorize @post
  end

  def edit
    authorize @post
  end  

  def update
    authorize @post
     
    if @post.update(require_params)
      redirect_to @post, notice: "your post was created succesfully"
    else
      render "edit"
    end  
  end  

  def destroy
    authorize @post

    @post.delete
    redirect_to posts_path, notice: "your post was deleted succesfully" 
  end  

  private
    def require_params
      params.require(:post).permit(:date, :rationale, :overtime_request) 
    end 

    def set_post
      @post = Post.find(params[:id])
    end   	
end
