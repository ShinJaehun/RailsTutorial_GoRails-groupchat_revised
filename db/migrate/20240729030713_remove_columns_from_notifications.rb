class RemoveColumnsFromNotifications < ActiveRecord::Migration[7.1]
  def change
    remove_column :notifications, :action, :string
    remove_column :notifications, :read_at, :datetime
    remove_column :notifications, :notifiable_id, :bigint
    remove_column :notifications, :notifiable_type, :string
    add_column :notifications, :body, :string
  end
end
