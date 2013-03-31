class CellaredBeersController < ApplicationController
  before_filter :authenticate_user!

  def create
    @beer = Beer.find(params[:cellared_beer][:beer_id])
    current_user.cellar!(@beer)
    respond_to do |format|
      format.html { redirect_to cellar_user_path(current_user) }
      format.js
    end
  end

  def destroy
    @beer = Cellared_beer.find(params[:id]).followed
    current_user.uncellar!(@beer)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end