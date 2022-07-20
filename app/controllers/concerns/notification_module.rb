# frozen_string_literal: true

module NotificationModule
  def create_notification(user_id, recipient_id, action)
    Notification.create(user_id: user_id, recipient_id: recipient_id, action: action)
  end
end
