class RegistrationsController < ApplicationController
  # before_action :authenticate_user!, except: [:create, :destroy]
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {mesasge: 'Done'}
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    u = User.find(params[:user][:id]) if (params[:user].present? && params[:user][:id].present?)
      if u&.nil? || params[:user][:token].nil? || params[:user][:token] != u.authentication_token
          head(:unauthorized); return
      end
    u.destroy
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end
end

# class Users::RegistrationsController < Devise::RegistrationsController
#     before_action :ensure_params_exist, only: :create
#     # sign up
#     def create
#       user = User.new user_params
#       puts "AAAA"
#       if user.save
#         puts "BBBB"
#         render json: {
#           messages: "Sign Up Successfully",
#           is_success: true,
#           data: {user: user}
#         }, status: :ok
#       else
#         puts "CCCC"
#         head(:unauthorized)
#         render json: {
#           messages: "Sign Up Failded",
#           is_success: false,
#           data: {}
#         }, status: :unprocessable_entity
#       end
#     end
  
#     private
#     def user_params
#       params.require(:user).permit(:email, :password, :password_confirmation)
#     end
  
#     def ensure_params_exist
#       return if params[:user].present?
#       render json: {
#           messages: "Missing Params",
#           is_success: false,
#           data: {}
#         }, status: :bad_request
#     end
# end