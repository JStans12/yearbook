class CensusUser

  attr_reader :first_name, :image_url

  def initialize(user_attributes)
    @first_name = user_attributes["first_name"]
    @image_url = user_attributes["image_url"]
  end

end
