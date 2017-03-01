class CensusApiService

  def self.fetch_people(access_token)
    conn = Faraday.new(:url => 'https://turing-census.herokuapp.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.params['access_token'] = access_token
    end
    response = conn.get '/api/v1/users'
    people_info = JSON.parse(response.body)
    CensusApiService.load_people(people_info)
  end

  def self.load_people(people_info)
    people_info.each do |person|
      next unless person["cohort"]
        cohort = Cohort.find_or_create_by(name: person["cohort"]["name"])
        cohort.people.create(first_name: person["first_name"],
                             last_name: person["last_name"],
                             photo_url: person["image_url"])
    end
  end

end
