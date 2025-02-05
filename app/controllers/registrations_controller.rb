# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :handle_registration_disabled, only: %i[new create]

  def new
    super
  end

  def create
    super
  end

  private

  def handle_registration_disabled
    redirect_to new_user_session_path, notice: I18n.t("registrations.disabled") if Rails.env.production?
  end
end
