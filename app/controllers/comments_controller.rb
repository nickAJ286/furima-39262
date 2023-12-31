class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @item = Item.find(params[:item_id])
    if @comment.save
      CommentChannel.broadcast_to @item, { comment: @comment, user: @comment.user }
      # ActionCable.server.broadcast "comment_channel", {comment: @comment, user: @comment.user} #商品に紐づいたプラウザで処理する為コメントアウト
      # redirect_to item_path(params[:item_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
