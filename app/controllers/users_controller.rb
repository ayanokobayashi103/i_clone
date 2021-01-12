class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  before_action :same_user_id, only: [:edit, :update]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
      @favorite_iclones = @user.favorite_iclones
  end

  def edit
    unless logged_in?
      redirect_to new_session_path, notice:"ログイン必須"
    end
  end

  def update
    if @user.update(edit_user_params)
      redirect_to user_path, notice:"プロフィール更新したよ☆"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :image, :image_cache)
    end

    def edit_user_params
      params.require(:user).permit(:name, :email, :image, :image_cache)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def same_user_id
      unless current_user.id == @user.id
        redirect_to user_path, notice:"エラー"
      end
    end

  end
