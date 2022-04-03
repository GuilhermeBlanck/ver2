class PartnersControl::RegistrationsController < ApplicationController
  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      render json: {mesasge: 'Done'}
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    @u = Partner.find(params[:partner][:id]) if (params[:partner].present? && params[:partner][:id].present?)
    if @u&.nil? || params[:partner][:token].nil? || params[:partner][:token] != @u.authentication_token
          head(:unauthorized); return
      end
    @u.destroy
    render json: {message: 'Partner successfully deleted.'}
  end

  private

  def partner_params
    params.require(:partner).permit(:email,:password,:password_confirmation)
  end
end