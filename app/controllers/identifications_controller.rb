class IdentificationsController < ApplicationController
  def new
    if params[:cohort_id]
      cohort = Cohort.find(params[:cohort_id])
      session[:cohort_id] = cohort.id
    else
      cohort = current_cohort
    end 
    users = cohort.people
    @identification = Identification.create(:person => users.random)
    redirect_to new_identification_guess_path(@identification)
  end
end
