class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications
  end

  #def create
    #puts '이건 될려나 모르겠다~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    #puts params
#    puts params[:message]
#    puts params[:_json].scan(/@([\w-]+)/)[0]
#    puts current_user.username
    #recipients = []
    #params[:to].uniq.each do |username|
      #recipients << User.where(username: username)[0]
    #end
    #from = User.where(username: params[:from])[0]

    #puts recipients

    ##recipients = User.where(username: params[:_json].scan(/@([\w-]+)/)[0])[0]
##    puts user.username
    #notification = Notification.post(recipients: recipients, actor: from, body: params[:message])

    #recipients.uniq.each do |recipient|
      #Notification.transaction do
        #Notification.create(recipient: recipient, actor: from, body: params[:message])
      #end
    #end
  #end

#  def notification_params
#    puts params
#  end
end
