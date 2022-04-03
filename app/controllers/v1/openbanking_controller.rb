class V1::OpenbankingController < ApplicationController
  before_action :validate_user_token
  def qualification
    data = JSON.parse PlaceholderInfo.find_by_name('qualification').data
    render json: {data: data[rand data.size]}
  end

  def identification
    data = JSON.parse PlaceholderInfo.find_by_name('identification').data
    render json: {data: data[rand data.size]}
  end
  
  private

  def validate_user_token
    @u = User.find(params[:user][:id]) unless params[:user].nil? || params[:user][:id].nil?
    if @u.nil? || params[:user][:token].nil? || @u.authentication_token != params[:user][:token]
      head(:unauthorized)
    end
    
  end
end
