require 'test_helper'

class CensusApiServiceTest < ActiveSupport::TestCase
  test "fetch_people" do
    VCR.use_cassette("census_users_index") do
      people = CensusApiService.fetch_people

      assert people.first["first_name"]
      assert people.first["last_name"]
      assert people.first["cohort"]
      assert people.first["image_url"]

      assert people.last["first_name"]
      assert people.last["last_name"]
      assert people.last["cohort"]
      assert people.last["image_url"]
    end
  end

  test "token" do
    VCR.use_cassette("census_client_credentials_token") do
      token = CensusApiService.token

      assert_equal String, token.class
      assert_equal 64, token.length
    end
  end
end
