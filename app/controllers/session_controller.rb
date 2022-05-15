
# 単数形
class SessionController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  # ログイン後, MFAせずにログアウトの経路がある
  skip_before_action :check_mfa, only: [:destroy]

  # GET /login
  def new
  end

  # POST /session
  def create
    if login(params[:email], params[:password])
      redirect_back_or_to('/', notice: 'Login successful')
    else
      flash[:alert] = 'Login failed'
      render 'new'
    end
  end

  # POST /logout
  def destroy
    logout
    redirect_to '/', notice: 'Logged out!'
  end

end
