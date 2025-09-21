# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      @user = User.from_omniauth(request.env["omniauth.auth"])

      if @user&.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
      elsif @user.nil?
        redirect_to new_user_session_url, alert: t(".forbidden")
      else
        session["devise.github_data"] = request.env["omniauth.auth"].except("extra")
        redirect_to new_user_session_url, alert: t(".failure")
      end
    end
  end
end
