class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_channel

  def create
    @message = @channel.messages.create(message_params)
    #puts 'FDDSAFSAFSAFDSAFASFSAFSAFSAFSAFDSAFDSAFDSAFDSAFSADFSADFDSAFSADFSAFDSADF'
    if (/@([\w-]+)/).match?(@message.body)
      #puts '이렇게 처리하는 건 어뗘?'
      mentioned_usernames = @message.body.scan(/@([\w-]+)/).flatten
      #mentioned_usernames.each do |username|
        #puts username
      #end
      #puts current_user.username
      recipients = []
      mentioned_usernames.uniq.each do |username|
        recipients << User.where(username: username)[0]
      end
      #from = User.where(username: current_user.username)[0]
      #이런 비융신 이걸 고대로 복붙하다가... null 값이라서 오류가 생긴게지...
      #puts recipients
      #notifications = Notification.post(recipients: recipients, actor: current_user, body: @message.body)
      recipients.uniq.each do |recipient|
        #puts '왜 안되는걸까?'
        Notification.create(recipient: recipient, actor: current_user, body: @message.body)
      end
    end

    MessageChannel.broadcast_to @channel, { message: render_to_string(@message)}
    UnreadsChannel.broadcast_to @channel, {}
  end

  private

  def set_channel
    @channel = current_user.channels.find(params[:channel_id])
  end

  def message_params
    params.require(:message).permit(:body).merge(user: current_user)
  end
end
