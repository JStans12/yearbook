class GuessesController < ApplicationController

  def new
    @identification = Identification.find(params[:identification_id])
    @guess = @identification.guesses.new
  end

  def create
    @identification = Identification.find(params[:identification_id])
    @guess = @identification.guesses.new(:hypothesis => params[:name])
    if @guess.validate
      flash[:message] = "Correct: #{params[:name]}"
      redirect_to new_identification_path
    else
      raise "HELL"
    end
  end
end
