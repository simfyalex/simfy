class UsersController < ApplicationController
  def index
    @users = User.by_letter(params[:letter]).includes(:artists,:albums)
  end

  def show
    @user = User.find_by_username(params[:id])
  end
end
