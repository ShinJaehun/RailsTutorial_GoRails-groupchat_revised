class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stop_all_streams
    #stream_for Channel.find_by id: params[:id]
    #puts Channel.first.attributes
    #puts "#######################################################"
    #puts current_user.username
    #puts "#######################################################"
    @channel_user = current_user.channel_users.find_by(channel_id: params[:id])
    @channel = @channel_user.channel
    stream_for @channel
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def touch
    @channel_user.touch(:last_read_at)
  end
end
