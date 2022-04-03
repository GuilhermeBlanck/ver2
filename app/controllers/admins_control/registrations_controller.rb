class AdminsControl::RegistrationsController < ApplicationController
  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      render json: {mesasge: 'Done'}
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @u = Admin.find(params[:admin][:id]) if (params[:admin].present? && params[:admin][:id].present?)
    if @u&.nil? || params[:admin][:token].nil? || params[:admin][:token] != @u.authentication_token
          head(:unauthorized); return
      end
    @u.destroy
    render json: {message: 'Amin successfully deleted.'}
  end

  private

  def admin_params
    params.require(:admin).permit(:email,:password,:password_confirmation)
  end
end