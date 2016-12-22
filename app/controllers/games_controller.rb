class GamesController < ApplicationController
  def new
  end

  def create
    Person.new_game
    redirect_to new_identification_path
  end
end
