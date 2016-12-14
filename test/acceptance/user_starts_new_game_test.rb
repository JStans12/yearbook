require 'test_helper'

class UserStartsNewGameTest < Capybara::Rails::TestCase
  # As a user
  # When I visit the root path
  # And I select a cohort
  # And I click Start Game
  # Then I am taken to the new game pa
  def test_it_starts_new_game
    skip
    visit root_path

    click_button "Start Game"

    assert current_path, new_identification_path
    assert page.has_css?("#photo")
  end
end
