class VpcController < ApplicationController
  def check
    render json: Redis.new.smembers(clean_phone_number)
  end

  private
  def clean_phone_number
    phone_number = params[:phone_number]
    phone_number.gsub!(/\D+/,"")
    phone_number
  end
end