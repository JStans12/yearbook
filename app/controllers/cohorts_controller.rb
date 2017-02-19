class CohortsController < ApplicationController

  def index
    @cohorts = Cohort.all.map {|cohort| cohort.name}
  end
  
end
