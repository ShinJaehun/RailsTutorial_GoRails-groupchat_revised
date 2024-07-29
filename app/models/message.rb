class Message < ApplicationRecord
  belongs_to :channel
  belongs_to :user

  after_create :process_mentions

  def process_mentions
    #UnreadsChannel.broadcast_to channel, {mention: mentioned_usernames, body: body, user: user.username}
    #model에서 current_user 대신 user를 사용할 수 있는겨?
    UnreadsChannel.broadcast_to channel, {mention: mentioned_usernames}
  end

  #def mentioned_users
    #User.where(username: mentioned_usernames) - [user]
  #end

  def mentioned_usernames
    body.scan(/@([\w-]+)/).flatten
  end
end
