require 'rails_helper'

describe Pet do
  before(:all) do
    pet_data = File.read("./spec/fixtures/random_pet.json")
    @data = JSON.parse(pet_data, symbolize_names: true)[:petfinder][:pet]
    @pet = Pet.new(@data)
  end

  it 'exist' do
    expect(@pet).to be_a(Pet)
  end

  it 'has attributes' do
    expect(@pet.name).to eq(@data[:name][:$t])
    expect(@pet.id).to eq(@data[:id][:$t])
    expect(@pet.age).to eq(@data[:age][:$t])
    expect(@pet.size).to eq(@data[:size][:$t])
    expect(@pet.sex).to eq(@data[:sex][:$t])
    expect(@pet.animal).to eq(@data[:animal][:$t])
  end

  it 'can get and array of breeds' do
    expect(@pet.breeds.count).to eq(2)
    expect(@pet.breeds[0]).to eq(@data[:breeds][:breed][0][:$t])
    expect(@pet.breeds[1]).to eq(@data[:breeds][:breed][1][:$t])
  end


  it 'get_breeds one hash' do
    array =  {
            breed: {
            :$t => "Havana"
                    }
             }
    expect(@pet.get_breed(array)).to eq("Havana")
  end
end
