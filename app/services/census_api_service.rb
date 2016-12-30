module CensusApiService
  def self.url
    'https://census-app-staging.herokuapp.com'
  end

  def self.conn
    Faraday.new(:url => url) do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.basic_auth(ENV['CENSUS_APPLICATION_ID'], ENV['CENSUS_SECRET'])
    end
  end

  def self.token
    response = conn.post do |req|
      req.url '/oauth/token'
      req.params['grant_type'] = 'client_credentials'
    end
    return false unless response.success?
    JSON.parse(response.body)['access_token']
  end

  def self.fetch_people
    response = conn.get do |req|
      req.url '/api/v1/users'
      req.headers['Authorization'] = "Bearer #{token}"
    end
    return false unless response.success?
    JSON.parse(response.body)
  end
end
