class FindFacade
  def initialize(params)
    @filter = _filter_string(params)
  end

  def find_pets
    list = PetFinderService.new(@filter).pets_list
    list[:petfinder][:pets][:pet].map do |pet|
      Pet.new(pet)
    end
  end

  private

  def _filter_string(params)
    uri = ""
    params.each_pair do |key, value|
      uri << "#{key.to_s}=#{value}"
    end
    uri
  end
end
