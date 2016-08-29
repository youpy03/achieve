class CommentsController < ApplicationController
#dive15記述
  # コメントを保存、投稿するためのアクションです。
  def create
    # ログインユーザーに紐付けてインスタンス生成するためbuildメソッドを使用します。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog

    # クライアント要求に応じてフォーマットを変更
    # respond_toは、クライアントからの要求に応じてレスポンスのフォーマットを変更します。
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        format.json { render :show, status: :created, location: @comment }
         # JS形式でレスポンスを返します。
        format.js { render :index }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
     @comment = Comment.find(params[:id])
     @blog = @comment.blog
   respond_to do |format|
      #if @comment.destroy
      if @comment.destroy
         format.html {redirect_to blog_path(@blog), notice: "コメントを削除しました！"}
         format.json { render :show, status: :created, location: @comment }
         format.js { render :index }
      else
          format.html { render :new }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

    #end
   #if @comment.destroy
  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:blog_id, :content)
    end
end
