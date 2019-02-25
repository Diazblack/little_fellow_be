class Api::V1::FindController < ApplicationController

  def index
    list = FindFacade.new(find_params).find_pets
    if list.class == Array
      render json: list
    else
      render json: list, status: list[:header][:status][:code][:$t].to_i
    end
  end

  private

  def find_params
    params.permit(:location)
  end
end
