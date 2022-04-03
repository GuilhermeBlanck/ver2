class RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {mesasge: 'Done'}
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @u = User.find(params[:user][:id]) if (params[:user].present? && params[:user][:id].present?)
      if @u&.nil? || params[:user][:token].nil? || params[:user][:token] != @u.authentication_token
          head(:unauthorized); return
      end
    @u.destroy
    render json: {message: 'User successfully deleted.'}
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end
end