require 'test_helper'

class GuestIdentifiesPeopleTest < Capybara::Rails::TestCase
  def test_it_reaches_a_new_identification
    visit '/identifications/new'
    assert_equal 200, page.status_code
  end
end
