require 'test_helper'

class GuestIdentifiesPeopleTest < Capybara::Rails::TestCase
  def test_it_reaches_a_new_identification
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
    ApplicationController.any_instance.stubs(:fetch_people).returns(people_params)
    cohort = Cohort.create(name: "1608-BE")
    cohort.people.create(first_name: "name", last_name: "last", photo_url: "http://s3.amazonaws.com/turingschool-census/users/images/000/000/014/original/Alene_Schlereth.jpg?1487538399")
    cohort.people.create(first_name: "name 2", last_name: "last 2", photo_url: "http://s3.amazonaws.com/turingschool-census/users/images/000/000/014/original/Alene_Schlereth.jpg?1487538399")

    visit "/identifications/new?cohort_id=#{cohort.id}"
    assert_equal 200, page.status_code
  end

  def test_a_correct_guess
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
    ApplicationController.any_instance.stubs(:fetch_people).returns(people_params)
    cohort = Cohort.create(name: "1608-BE")
    cohort.people.create(first_name: "name", last_name: "last", photo_url: "http://s3.amazonaws.com/turingschool-census/users/images/000/000/014/original/Alene_Schlereth.jpg?1487538399")
    cohort.people.create(first_name: "name 2", last_name: "last 2", photo_url: "http://s3.amazonaws.com/turingschool-census/users/images/000/000/014/original/Alene_Schlereth.jpg?1487538399")

    visit "/identifications/new?cohort_id=#{cohort.id}"
    answer = page.find('#answer').text
    page.click_link_or_button(answer)

    assert_equal 200, page.status_code
    assert page.has_content?("Correct: #{answer}")
  end

  def test_a_wrong_guess_redisplays_the_guess_page
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
    ApplicationController.any_instance.stubs(:fetch_people).returns(people_params)
    cohort = Cohort.create(name: "1608-BE")
    cohort.people.create(first_name: "name", last_name: "last", photo_url: "http://s3.amazonaws.com/turingschool-census/users/images/000/000/014/original/Alene_Schlereth.jpg?1487538399")
    cohort.people.create(first_name: "name 2", last_name: "last 2", photo_url: "http://s3.amazonaws.com/turingschool-census/users/images/000/000/014/original/Alene_Schlereth.jpg?1487538399")

    visit "/identifications/new?cohort_id=#{cohort.id}"
    answer = page.find('#answer').text

    within('#possibilities') do
      wrong_name = page.find_all('a').detect{|link| link.text != answer }.text
      page.click_link_or_button(wrong_name)
    end

    assert_equal 200, page.status_code
    assert page.has_content?("You guessed")
    assert_equal answer, page.find('#answer').text
  end

end
