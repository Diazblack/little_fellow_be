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
    @name = data[:name][:$t] ||= nil
    @id = data[:id][:$t] ||= nil
    @age = data[:age][:$t] ||= nil
    @size = data[:size][:$t] ||= nil
    @sex = data[:sex][:$t] ||= nil
    @animal = data[:animal][:$t] ||= nil
    @img_url = get_url(data[:media])
    @phone = data[:contact][:phone][:$t] ||= nil
    @email = data[:contact][:email][:$t] ||= nil
    @address_1 = data[:contact][:address1][:$t] ||= nil
    @address_2 = data[:contact][:address2][:$t] ||= nil
    @city = data[:contact][:city][:$t] ||= nil
    @state = data[:contact][:state][:$t] ||= nil
    @zip_code = data[:contact][:zip][:$t] ||= nil
    @last_update = Date.parse(data[:lastUpdate][:$t])
    @description = data[:description][:$t] ||= nil
    @shelter_id = data[:shelterPetId][:$t] ||= nil
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
    if data.has_key?(:photos)
      data[:photos][:photo].find do |obj|
        return obj[:$t] if obj[:@size] == "x"
      end
    end
  end
end
