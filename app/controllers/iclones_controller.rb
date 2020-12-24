class IclonesController < ApplicationController
  before_action :set_iclone, only: [:edit, :show, :update, :destroy]
  def index
    @iclones =  Iclone.all
  end
  def new
    @iclone = Iclone.new
  end
  def create
  @iclone = current_user.iclones.build(iclone_params)
    if params[:back]
      render :new
    else
      if @iclone.save
        redirect_to iclones_path, notice:"作成しました！"
      else
        render :new
      end
    end
  end
  def show
    @favorite = current_user.favorites.find_by(iclone_id: @iclone.id)
  end
  def edit
  end
  def update
    if @iclone.update(iclone_params)
      redirect_to iclones_path, notice:"更新しました！"
    else
      render :edit
    end
  end
  def destroy
    @iclone.destroy
    redirect_to iclones_path, notice:"削除しました！"
  end
  def confirm
    @iclone = current_user.iclones.build(iclone_params)
    render :new if @iclone.invalid?
  end

  private
  def iclone_params
    params.require(:iclone).permit(:image, :content)
  end
  def set_iclone
    @iclone = Iclone.find(params[:id])
  end
end
