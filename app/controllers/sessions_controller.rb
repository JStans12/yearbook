class SessionsController < ApplicationController
  def create
    census_user_info = env["omniauth.auth"]
    user = User.find_or_create_by(census_id: census_user_info.info.id)
    user.update_attributes(first_name: census_user_info.info.first_name,
                           last_name: census_user_info.info.last_name,
                           access_token: census_user_info.info.token)
    redirect_to root_path
  end
end
