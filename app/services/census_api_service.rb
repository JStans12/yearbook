class CensusApiService
  def self.url
    'https://census-app-staging.herokuapp.com'
  end

  def self.fetch_people
    conn = Faraday.new(:url => url) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get do |req|
      req.url '/api/v1/users'
      req.headers['Authorization'] = 'Bearer 1e71efa360f770c4698a9ea989927b800ed9c2aaa07ca2b414db5ef2052f20ec'
    end
    JSON.parse(response.body)
  end
end
