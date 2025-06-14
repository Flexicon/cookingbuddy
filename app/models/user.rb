# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :trackable,
    :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    return nil unless allowed_emails.include?(auth.info.email)

    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name || auth.info.nickname
      user.image_url = auth.info.image
    end
  end

  def self.allowed_emails
    @allowed_emails ||= Rails.application.credentials.dig(:github, :allowed_emails) || []
  end

  def initials
    name.split.map { |n| n[0].upcase }.join if name.present?
  end

  def first_name
    name.split.first if name.present?
  end
end
