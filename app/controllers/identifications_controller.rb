class IdentificationsController < ApplicationController
  def new
    @identification = Identification.create(:person => Person.random)
    redirect_to new_identification_guess_path(@identification)
  end
end
