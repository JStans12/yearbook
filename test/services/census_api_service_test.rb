require 'test_helper'

class CensusApiServiceTest < ActiveSupport::TestCase
  test "fetch_people" do
    VCR.use_cassette("census_users_index") do
      people = CensusApiService.fetch_people

      assert people.first["first_name"]
      assert people.first["last_name"]
      assert people.first["image_url"]

      assert people.last["first_name"]
      assert people.last["last_name"]
      assert people.last["image_url"]
    end
  end
end
