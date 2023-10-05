class CommentChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # stream_from "comment_channel" #商品に紐づいたプラウザで処理する為コメントアウト
    @item = Item.find(params[:item_id]) 
    stream_for @item 
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
