require 'rails_helper'

describe PetFinderService do
  before(:all) do
    @service = PetFinderService.new(nil)
  end
  it 'exists' do
    expect(@service).to be_a PetFinderService
  end

  context "Instance Methods" do
    context "random_pet" do
      it 'should return a pet json ' do
        VCR.use_cassette("pet_finder_one_pet") do
          expect(@service.random_pet).to have_key(:petfinder)
          expect(@service.random_pet[:petfinder]).to have_key(:pet)
          expect(@service.random_pet[:petfinder][:pet]).to be_a(Hash)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:contact)
          expect(@service.random_pet[:petfinder][:pet][:contact]).to have_key(:phone)
          expect(@service.random_pet[:petfinder][:pet][:contact]).to have_key(:address1)
          expect(@service.random_pet[:petfinder][:pet][:contact]).to have_key(:address2)
          expect(@service.random_pet[:petfinder][:pet][:contact]).to have_key(:city)
          expect(@service.random_pet[:petfinder][:pet][:contact]).to have_key(:state)
          expect(@service.random_pet[:petfinder][:pet][:contact]).to have_key(:email)
          expect(@service.random_pet[:petfinder][:pet][:contact]).to have_key(:zip)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:age)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:size)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:media)
          expect(@service.random_pet[:petfinder][:pet][:media]).to have_key(:photos)
          expect(@service.random_pet[:petfinder][:pet][:media][:photos]).to have_key(:photo)
          expect(@service.random_pet[:petfinder][:pet][:media][:photos][:photo]).to be_a(Array)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:id)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:shelterId)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:breeds)
          expect(@service.random_pet[:petfinder][:pet][:breeds]).to have_key(:breed)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:name)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:sex)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:description)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:lastUpdate)
          expect(@service.random_pet[:petfinder][:pet]).to have_key(:mix)
        end
      end
    end
  end
end
