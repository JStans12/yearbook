class IdentificationsController < ApplicationController
  def new
    # checks for people cookie
    # if none then load people from api and save to cookie
    # grab random person from cookie
    def people
        session[:people] || fetch_people
    end

    def fetch_people
      conn = Faraday.new(:url => 'https://census-app-staging.herokuapp.com') do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      response = conn.get '/api/v1/all_users'
      response.body
    end


    @identification = Identification.create(:person => people.sample)
    redirect_to new_identification_guess_path(@identification)
  end
end
