class GamesController < ApplicationController
  def new
  end

  def create
    Person.new_game

    person = Person.new
    person.clear_all_people
    CensusApiService.fetch_people.each do |person|
      cohort = Cohort.find_or_create_by(name: person["cohort"])
      cohort.people.create(first_name: person["first_name"],
                           last_name: person["last_name"],
                           photo_url: person["image_url"])
    end

    redirect_to new_identification_path
  end
end
