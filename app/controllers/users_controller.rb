class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def applications
    @user = User.find(params[:id])
    @applications = @user.applications
  end

  private

  def user_params
    params.require(:user).permit(:photo, :relevant_data)
  end
end
