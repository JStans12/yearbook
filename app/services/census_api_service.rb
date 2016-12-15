module CensusApiService
  def self.fetch_people
    conn = Faraday.new(:url => 'http://localhost:3000') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get '/api/v1/users'
    JSON.parse(response.body)
  end
end
