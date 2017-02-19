class GamesController < ApplicationController
  before_action :clear_all_people, only: :create

  def new
  end

  def create
    fetch_people.each do |person|
      cohort = Cohort.find_or_create_by(name: person["cohort"]["name"])
      cohort.people.create(first_name: person["first_name"],
                           last_name: person["last_name"],
                           photo_url: person["image_url"])
    end

    redirect_to new_identification_path
  end

  private

  def fetch_people
    conn = Faraday.new(:url => 'https://turing-census.herokuapp.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      faraday.params['access_token'] = current_user.access_token
    end
    response = conn.get '/api/v1/users'
    JSON.parse(response.body)
  end

  def clear_all_people
    Person.destroy_all
  end

end
