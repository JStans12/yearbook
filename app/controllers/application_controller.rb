class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_cohort

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_cohort
    @current_cohort ||= Cohort.find(session[:cohort_id]) if session[:cohort_id]
  end
end
