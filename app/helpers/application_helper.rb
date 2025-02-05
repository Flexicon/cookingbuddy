# frozen_string_literal: true

module ApplicationHelper
  def registration_enabled?
    Rails.env.development?
  end
end
