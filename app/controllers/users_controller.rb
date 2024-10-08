# -*- coding:utf-8 -*-

class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  # 手抜いて users コントローラでユーザ登録しているが、後段の本人確認などを行う
  # ため, account コントローラなどを作った方がよい.
  skip_before_action :require_login, only: %i[new create]


  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params.permit(:email, :password,
                                        :password_confirmation))
    if @user.save
      redirect_to '/', notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to user_url(@user), notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end


private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {})
  end
end
