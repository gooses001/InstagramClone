class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
     @blog = Blog.new
    end
  end

  def create
    @blog = Blog.create(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      @user = current_user
      redirect_to new_blog_path, notice: "画像を投稿しました！"
      ContactMailer.contact_mail(@user).deliver  #mailer用追記
    else
      render'new'
    end
  end
  
  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)

  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
   @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "投稿を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"投稿を削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end


  private

  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end

end

