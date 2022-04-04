class V1::OpenbankingController < ApplicationController
  before_action :validate_user_token

  # This controller should request data from banks APIs,
  # but seeing as these data can only be accessed by 
  # another financial institution, it uses placeholder
  # data from https://openbankingbrasil.atlassian.net/wiki

  def qualification
    data = JSON.parse PlaceholderInfo.find_by_name('qualification').data
    render json: {data: data[rand data.size]}
  end

  def identification
    data = JSON.parse PlaceholderInfo.find_by_name('identification').data
    render json: {data: data}
  end

  def request_data_sharing
    unless params[:info_type].nil?
      pi = PlaceholderInfo.find_by_name(params[:info_type])

      # Refresh if this data already exists
      unless u.openbanking_infos.find_by_name(params[:info_type]).nil?
        u.openbanking_infos.find_by_name(params[:info_type]).delete
      end

      unless pi.nil?
        @u.openbanking_infos << OpenbankingInfo.create( pi.attributes.slice('name','data') )
        render json: 'Information obtained successfully!'
      else
        render json: {message: 'Cant get info of type ' + params[:info_type]}, status: :no_content
      end
    else
      render json: {message: 'Info type not informed!'}, status: :bad_request
    end
  end
  
  def clear_expired_data
    # Clear user OpenBanking data after its allowed period
    # To be called by a job scheduler at least once a day
    OpenbankingInfo.each do |obi|
      obi.delete if obi.expiry_date > Time.now
    end
  end

  private

  def validate_user_token
    @u = User.find(params[:user][:id]) unless params[:user].nil? || params[:user][:id].nil?
    if @u.nil? || params[:user][:token].nil? || @u.authentication_token != params[:user][:token]
      head(:unauthorized)
    end
    
  end

  
end
