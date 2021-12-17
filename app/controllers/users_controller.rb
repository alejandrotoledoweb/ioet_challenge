class UsersController < ApplicationController

  def create
    @user = User.create!(user_params)
  end

  def index
    @users = User.all
    render json: { users: @users }, status: :ok
  end

  private

  def user_params
    params.permit(:name)
  end
end
