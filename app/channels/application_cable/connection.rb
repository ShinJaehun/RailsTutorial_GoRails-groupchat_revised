module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # 어쨌든 이 내용이 들어가니까 channels에서 current_user 사용이 가능해졌다...
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
      logger.add_tags "ActionCable", "User #{current_user.id}" #이것도 신기함...
    end

    protected

    def find_verified_user
      if current_user = env['warden'].user #대체 이게 뭘까
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
