class ThatController < ApplicationController
  # skip_before_action :verify_signed_out_user, only: :it
  def it
    puts 'AAA'
    render json: {a: '1'}
  end
end
