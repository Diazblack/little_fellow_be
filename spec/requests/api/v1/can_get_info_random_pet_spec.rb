require 'rails_helper'

describe 'Welcome page' do
  scenario 'get a random pet info' do
    get '/api/v1/'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    resp = JSON.parse(response.body, symbolize_names: true)

    expect(resp).to be_a(Hash)
    expect(resp).to have_key(:name)
    expect(resp).to have_key(:id)
    expect(resp).to have_key(:phone)
    expect(resp).to have_key(:sex)
    expect(resp).to have_key(:animal)
    expect(resp).to have_key(:shelter_id)
    expect(resp).to have_key(:description)
    expect(resp).to have_key(:age)
    expect(resp).to have_key(:size)
    expect(resp).to have_key(:address_1)
    expect(resp).to have_key(:address_2)
    expect(resp).to have_key(:city)
    expect(resp).to have_key(:state)
    expect(resp).to have_key(:zip_code)
    expect(resp).to have_key(:phone)
    expect(resp).to have_key(:email)
    expect(resp).to have_key(:img_url)
  end
end
