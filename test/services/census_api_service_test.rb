require "test_helper"

class CensusApiServiceTest < ActiveSupport::TestCase

  test "load_people " do
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

    assert_equal 5, Person.count
    assert_equal 0, Cohort.count

    CensusApiService.load_people(people_params)

    assert_equal 6, Person.count
    assert_equal 1, Cohort.count
    assert_equal "First", Person.last.first_name
    assert_equal "Last", Person.last.last_name
    assert_equal "1608-BE", Cohort.last.name
  end

end
