class IdentificationsController < ApplicationController
  def new
    if params[:cohort_id]
      cohort = Cohort.find(params[:cohort_id])
      session[:cohort_id] = cohort.id
    else
      cohort = current_cohort
    end
    users = fetch_users
    people = users.map do |user|
      CensusUser.new(user)
    end
    @identification = Identification.new(people.sample)
    redirect_to new_identification_guess_path(@identification.person.first_name, @identification.person.image_url)
  end

private

def fetch_users
    conn = Faraday.new(:url => 'https://turing-census.herokuapp.com') do |f|
      f.request :url_encoded
      f.adapter Faraday.default_adapter
      f.params['access_token'] = current_user.access_token
      f.params['cohort_id'] = current_cohort.census_id
    end
    response = conn.get '/api/v1/users/by_cohort'
    JSON.parse(response.body)
end

end
