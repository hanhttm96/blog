class CommentsharesController < InheritedResources::Base


  before_action :load_share

  def create
      @commentshare = @share.commentshares.new(commentshare_params)
    if @commentshare.save
      redirect_to @share, notice: 'Thank for your comment'
    else
      redirect_to @share, alert: 'Unable to add comment'
    end
  end
  def destroy
    @commentshare = @share.commentshares.find(params[:id])
    @commentshare.destroy
    redirect_to @share, notice: ''
  end
  private
    def load_share
      @share = Share.find(params[:share_id])
    end

    def commentshare_params
      params.require(:commentshare).permit(:body, :user_id)
    end
end

