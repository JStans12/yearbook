class GamesController < ApplicationController
  def new
  end

  def create
    clear_all_people
    people_info = CensusApiService.fetch_people(current_user.access_token)
    CensusApiService.load_people(people_info)
    redirect_to cohorts_path
  end

  private

  def clear_all_people
    Person.destroy_all
  end

end
