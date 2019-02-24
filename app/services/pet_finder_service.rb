class PetFinderService
  def initialize(filter)
    @filter = filter
    @key = ENV['petfinder_api_key']
  end

  def random_pet
    get_json("pet.getRandom?format=json&key=#{@key}&output=full")
  end

  private

  def get_json(uri)
    resp = conn.get(uri)
    JSON.parse(resp.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "http://api.petfinder.com/" ) do |f|
      f.adapter Faraday.default_adapter
    end
  end
end
