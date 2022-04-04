class V1::ProposalsController < ApplicationController
  before_action :validate_user_token, only: :create_user_proposal
  before_action :validate_partner_token, only: :create_partner_proposal

  def create_user_proposal
    unless params[:proposal_data].nil?
      up = UserProposal.create(data: params[:proposal_data])
      @u.user_proposals << up
      @u.save
      render json: {message: 'Proposal created'}
    else
      render json: {message: 'No proposal data!'}, status: :bad_request
    end
  end

  def create_partner_proposal
    unless params[:proposal_data].nil?
      pp = ParterProposal.create(data: params[:proposal_data])
      @p.partner_proposals << pp
      @p.save
      render json: {message: 'Proposal created'}
    else
      render json: {message: 'No proposal data!'}, status: :bad_request
    end
  end

  private

  def validate_user_token
    @u = User.find(params[:user][:id]) unless params[:user].nil? || params[:user][:id].nil?
    if @u.nil? || params[:user][:token].nil? || @u.authentication_token != params[:user][:token]
      head(:unauthorized)
    end  
  end

  def validate_partner_token
    @p = Partner.find(params[:partner][:id]) unless params[:partner].nil? || params[:partner][:id].nil?
    if @p.nil? || params[:partner][:token].nil? || @p.authentication_token != params[:partner][:token]
      head(:unauthorized)
    end  
  end    

end
