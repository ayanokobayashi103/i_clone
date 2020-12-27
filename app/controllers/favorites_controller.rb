class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(iclone_id: params[:iclone_id])
    redirect_to iclones_url, notice: "#{favorite.iclone.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to iclones_url, notice: "#{favorite.iclone.user.name}さんのブログをお気に入り解除しました"
  end
  def show
    @favorite_iclones = current_user.favorite_iclones
    @user = current_user
  end
end
