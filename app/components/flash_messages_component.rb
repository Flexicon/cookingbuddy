# frozen_string_literal: true

class FlashMessagesComponent < ViewComponent::Base
  ALERT_TYPES = {
    notice: "bg-base-100 dark:bg-gray-800",
    error: "alert-error",
    alert: "alert-warning",
    success: "alert-success",
    info: "alert-info"
  }.freeze

  BTN_TYPES = {
    notice: "",
    error: "btn-error",
    alert: "btn-warning",
    success: "btn-success",
    info: "btn-info"
  }.freeze

  def initialize(flash:)
    @flash = flash.map do |type, message|
      [
        type,
        message,
        ALERT_TYPES[type.to_sym] || "alert-info",
        BTN_TYPES[type.to_sym] || "btn-info"
      ]
    end
  end
end
