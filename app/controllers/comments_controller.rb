class CommentsController < ApplicationController


  before_action :load_article

  def create
      @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to @article, notice: 'Thank for your comment'
    else
      redirect_to @article, alert: 'Unable to add comment'
    end
  end
  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, notice: ''
  end
  private
    def load_article
      @article = Article.find(params[:article_id])
    end
    def comment_params
      params.require(:comment).permit(:body, :email, :body, :user_id)
    end
end