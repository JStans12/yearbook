class GuessesController < ApplicationController

  def new
    @identification = Identification.find(params[:identification_id])
    @guess = @identification.guesses.new
  end

  def create
    @identification = Identification.find(params[:identification_id])
    @guess = @identification.guesses.create(:hypothesis => params[:name])

    if @guess.correct?
      flash[:success] = "Correct: #{params[:name]}"
      redirect_to new_identification_path
    else
      flash[:error] = "You guessed #{params[:name]} but this is #{@identification.person.first_name}"
      redirect_to new_identification_guess_path(:identification => @identification)
    end
  end
end
