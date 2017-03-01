require 'test_helper'

class UserStartsNewGameTest < Capybara::Rails::TestCase
  def test_it_starts_new_game
    VCR.use_cassette("census_users_index") do
      user = User.create(first_name: "First", last_name: "Last", access_token: "1j39jd693jd70djw0e7fj", census_id: 73)
      ApplicationController.any_instance.stubs(:current_user).returns(user)
      people_params = [{"id"=>14,
          "first_name"=>"First",
          "last_name"=>"Last",
          "cohort"=>{"id"=>1, "name"=>"1608-BE", "created_at"=>"2017-02-14T22:18:26.791Z", "updated_at"=>"2017-02-14T22:23:02.478Z", "status"=>"active"},
          "image_url"=>"http://s3.amazonaws.com/turingschool-census/users/images/000/000/014/original/Alene_Schlereth.jpg?1487538399",
          "email"=>"a@eamail.net",
          "slack"=>"person",
          "roles"=>
           [{"id"=>12, "name"=>"active student", "created_at"=>"2017-02-14T22:18:26.885Z", "updated_at"=>"2017-02-14T22:18:26.885Z"},
            {"id"=>17, "name"=>"admin", "created_at"=>"2017-02-14T22:18:26.978Z", "updated_at"=>"2017-02-14T22:18:26.978Z"}],
          "groups"=>["Pahlka", "Joan Clarke "]}]
      GamesController.any_instance.stubs(:fetch_people).returns(people_params)
      cohort = Cohort.create(name: "1608-BE")
      cohort.people.create(first_name: "name", last_name: "last", photo_url: "http://s3.amazonaws.com/turingschool-census/users/images/000/000/014/original/Alene_Schlereth.jpg?1487538399")
      cohort.people.create(first_name: "name 2", last_name: "last 2", photo_url: "http://s3.amazonaws.com/turingschool-census/users/images/000/000/014/original/Alene_Schlereth.jpg?1487538399")

      visit root_path

      assert current_path, new_game_path
      assert Person.count, 0

      click_button "Start Game"

      assert current_path, cohorts_path
      select "#{cohort.name}", from: "cohort_id"
      click_on "Play Game!"

      assert page.has_css?("#photo")
      refute_equal Person.count, 0
    end
  end
end
