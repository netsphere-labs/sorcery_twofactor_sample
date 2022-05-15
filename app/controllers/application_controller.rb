
class ApplicationController < ActionController::Base
  # ポカ避けのため, 基底クラスで require_login し, 不要な時は派生クラスで skip
  # する.
  # Sorcery::Controller::InstanceMethods で定義される.
  before_action :require_login

  before_action :check_mfa


private

  # 未ログインの状態で要ログインのページにアクセスした時に呼び出される
  def not_authenticated
    redirect_to login_path, alert: 'Please login first'
  end

  # For before_action
  # ログイン後、mfa を強制
  def check_mfa
    return if !current_user

    if !(user_mfa_session = UserMfaSession.find) ||
       user_mfa_session.record.email != current_user.email
      #logout
      redirect_to new_user_mfa_session_path
    end
  end
end
