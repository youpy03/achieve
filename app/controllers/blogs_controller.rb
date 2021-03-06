class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only: [:show,:edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end
  #dive15 comment機能追記
  # showアククションを定義します。入力フォームと一覧を表示するためインスタンスを２つ生成します。
  def show
    @comment = @blog.comments.build
    @comments = @blog.comments
  end

  def new
    if params[:back]
      @blog = Blog.new(blogs_params)
    else
      @blog = Blog.new
    end
  end

  def create
    @blog = Blog.new(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @blog.update(blogs_params)
    redirect_to blogs_path, notice: "ブログを更新しました！"
  end

  def destroy
  if current_user.user_id == blog.user_id
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  else
    redirect_to blogs_path
  end
  end

  def confirm
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  private
    def blogs_params
      params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
