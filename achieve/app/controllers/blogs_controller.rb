class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
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
      if @blog.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "ブログを作成しました！"
      else
        # 入力フォームを再描画します。
        render action: 'new'
      end
  end
  
  def edit
    if params[:back]
    @blog = Blog.new(blogs_params)
    else
    @blog = Blog.find(params[:id])
    end
  end

  def confirm_new
    @blog = Blog.new(blogs_params)
    render :new if @blog.invalid?
  end

  def confirm_edit
    @blog = Blog.new(blogs_params)
    @blog.id = params[:id]
    render :new if @blog.invalid?
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blogs_params)
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "Tweetを更新しました！"
    else
      # 入力フォームを再描画します。
      render action: 'edit'
    end
  end
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end
  
  private
    def blogs_params
      params.require(:blog).permit(:content)
    end

end
