# frozen_string_literal: true

class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    html = ApplicationController.render partial: "notifications/detail", locals: { notification: notification },
                                        formats: [:html]
    ActionCable.server.broadcast "notifications:#{notification.recipient_id}", html: html
  end
end
