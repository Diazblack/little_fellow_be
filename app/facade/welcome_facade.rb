class WelcomeFacade
  def initialize(data)
    @filter = data
  end

  def welcome
    pet = PetFinderService.new(@filter).random_pet
    Pet.new(pet[:petfinder][:pet])
  end
end
