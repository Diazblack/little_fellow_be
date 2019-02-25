class Api::V1::FindController < ApplicationController
  
  def index
    render json: FindFacade.new(find_params).find_pets
  end

  private

  def find_params
    params.permit(:location)
  end
end
