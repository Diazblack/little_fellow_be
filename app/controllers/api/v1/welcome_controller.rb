class Api::V1::WelcomeController < ApplicationController
  def index
    render json: WelcomeFacade.new(nil).welcome
  end
end
