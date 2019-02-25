require 'rails_helper'

describe 'find endpoint' do
  scenario 'get a list of pets by sending a location' do
    stub_pet_finder_find_by_location
    
    params = { "location": "Denver, CO" }

    get '/api/v1/find', params: params

    expect(response).to be_successful
    expect(response.status).to eq(200)

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp).to be_a(Array)
    expect(resp.count).to eq(25)
    resp.each do |pet|
      expect(pet).to be_a(Hash)
      expect(pet).to have_key(:name)
      expect(pet).to have_key(:id)
      expect(pet).to have_key(:phone)
      expect(pet).to have_key(:sex)
    end
  end
end