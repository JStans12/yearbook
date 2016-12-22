module CensusApiService
  def self.fetch_people
    conn = Faraday.new(:url => 'https://census-app-staging.herokuapp.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get '/api/v1/users'
    JSON.parse(response.body)
  end
end
