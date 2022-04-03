class V1::OpenbankingController < ApplicationController
  def qualification
    data = JSON.parse PlaceholderInfo.find_by_name('qualification').data
    render json: data[rand data.size]
  end
end
