class GamesController < ApplicationController
  def new
  end

  def create
    clear_all_people

    fetch_cohorts.each do |cohort|
      cohurt = Cohort.find_or_create_by(name: cohort["name"])
      cohurt.update_attributes(census_id: cohort["id"])
    end
    # fetch_people.each do |person|
    #   cohort = Cohort.find_or_create_by(name: person["cohort"]["name"])
    #   cohort.people.create(first_name: person["first_name"],
    #                        last_name: person["last_name"],
    #                        photo_url: person["image_url"])
    # end

    redirect_to cohorts_path
  end

  private

  # def fetch_people
  #   conn = Faraday.new(:url => 'https://turing-census.herokuapp.com') do |faraday|
  #     faraday.request  :url_encoded             # form-encode POST params
  #     faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
  #     faraday.params['access_token'] = current_user.access_token
  #   end
  #   response = conn.get '/api/v1/users'
  #   JSON.parse(response.body)
  # end

  def fetch_cohorts
      conn = Faraday.new(:url => 'https://turing-census.herokuapp.com') do |f|
        f.request :url_encoded
        f.adapter Faraday.default_adapter
        f.params['access_token'] = current_user.access_token
      end
      response = conn.get '/api/v1/cohorts'
      JSON.parse(response.body)
  end

  def clear_all_people
    Person.destroy_all
  end

end

# => {"id"=>2, "name"=>"1608-FE", "created_at"=>"2017-02-14T22:18:26.800Z", "updated_at"=>"2017-02-14T22:22:26.520Z", "status"=>"active"}
