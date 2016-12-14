require 'test_helper'

class UserStartsNewGameTest < Capybara::Rails::TestCase
  # As a user
  # When I visit the root path
  # And I select a cohort
  # And I click Start Game
  # Then I am taken to the new game pa
  def test_it_starts_new_game
    visit root_path

    assert current_path, new_game_path
    assert Person.count, 0

    click_button "Start Game"

    assert current_path, new_identification_path
    assert page.has_css?("#photo")
    refute_equal Person.count, 0
  end
end
