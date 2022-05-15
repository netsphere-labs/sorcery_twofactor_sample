# -*- coding:utf-8 -*-

if RUBY_VERSION >= "3.0.0"
def URI.encode str, unsafe = nil
  URI.encode_www_form_component(str)
end
end

# 単数形
class UserMfaSessionController < ApplicationController
  # 2FAなので、ユーザログインは必須.
  #skip_before_action :require_login
  skip_before_action :check_mfa

  # GET /user_mfa_session/new
  def new
    @user = current_user
    raise "internal error" if !@user.google_secret
  end

  # POST /user_mfa_session
  def create
    @user = current_user
    if @user.google_authentic?(params[:auth][:mfa_code])
      # persistence_token はクッキーのキー.
      unless @user.persistence_token
        @user.persistence_token = SecureRandom.hex
        @user.save!
      end
      UserMfaSession.create(@user)
      redirect_to user_path(@user), notice: 'MFA successful'
    else
      flash[:alert] = "Wrong code"
      render :new
    end
  end

end
