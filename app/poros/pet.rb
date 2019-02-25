class Pet
  attr_reader :name,
              :id,
              :age,
              :size,
              :sex,
              :animal,
              :img_url,
              :phone,
              :email,
              :address_1,
              :address_2,
              :city,
              :state,
              :zip_code,
              :last_update,
              :description,
              :shelter_id,
              :breeds

  def initialize(data)
    @name = data[:name][:$t]
    @id = data[:id][:$t]
    @age = data[:age][:$t]
    @size = data[:size][:$t]
    @sex = data[:sex][:$t]
    @animal = data[:animal][:$t]
    @img_url = get_url(data[:media][:photos][:photo])
    @phone = data[:contact][:phone][:$t]
    @email = data[:contact][:email][:$t]
    @address_1 = data[:contact][:address1][:$t]
    @address_2 = data[:contact][:address2][:$t]
    @city = data[:contact][:city][:$t]
    @state = data[:contact][:state][:$t]
    @zip_code = data[:contact][:zip][:$t]
    @last_update = Date.parse(data[:lastUpdate][:$t])
    @description = data[:description][:$t]
    @shelter_id = data[:shelterPetId][:$t]
    @breeds = get_breed(data[:breeds]) if data[:breeds][:breed]

  end

  def get_breed(data)
    if data[:breed].class == Array
      data[:breed].map do |obj|
        obj[:$t]
      end
    elsif data[:breed].class == Hash
      data[:breed][:$t]
    end

  end

  def get_url(data)
    data.find do |obj|
      return obj[:$t] if obj[:@size] == "x"
    end
  end
end
