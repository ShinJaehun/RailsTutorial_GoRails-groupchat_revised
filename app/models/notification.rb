class Notification < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  #belongs_to :notifiable, polymorphic: true

  #scope :unread, -> { where(read_at: nil) }
  #scope :recent, -> { order(created_at: :desc).limit(5) }

  #def self.post(recipients:, actor:, body:)
  # 굳이 이렇게 하지 않아도 notification을 message_controller.rb에서 생성할 수 있음
    #puts '이거 실행되지 않는건가요????????????????????????????????????????????'
    #notifications = recipients.uniq.each do |recipient|
      #Notification.transaction do
        #Notification.create(
          #body: body,
          #recipient: recipient,
          #actor: actor
        #)
      #end
    #end
    #notifications
  #end

#  def self.post(to:, from:, action:, notifiable:)
#    recipients = Array.wrap(to)
#    notifications = []
#
#    Notification.transaction do
#      notifications = recipients.uniq.each do |recipent|
#        Notification.create(
#          notifiable: notifiable,
#          action: action,
#          recipient: recipient,
#          actior: from
#        )
#      end
#    end
#    notifications
#  end

end
