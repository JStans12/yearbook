class SessionsController < ApplicationController
  def create
    census_user_info = env["omniauth.auth"]
    redirect_to root_path
  end
end
