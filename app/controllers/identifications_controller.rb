class IdentificationsController < ApplicationController
  def new
    # checks for people cookie
    # if none then load people from api and save to cookie
    # grab random person from cookie
    # def people
    #     session[:people] ||= fetch_people
    # end

    # @identification = Identification.create(:person_id => people.sample["id"])
    @identification = Identification.create(:person => Person.random)
    redirect_to new_identification_guess_path(@identification)
  end
end
