class Api::V1::WelcomeController < ApplicationController
  def index
    render json: WelcomeFacade.new(params[:nada]).welcome
  end
end
