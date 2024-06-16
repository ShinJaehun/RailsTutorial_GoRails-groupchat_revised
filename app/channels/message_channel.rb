class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stop_all_streams
    stream_for Channel.find_by id: params[:id]
    #stream_for Channel.find(params["id"]) #이게 다 id를 이상하게 넘겼기 때문이지.....머
    #stream_for Channel.find(params[:id])
    #stream_for Channel.first
    puts Channel.first.attributes
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
