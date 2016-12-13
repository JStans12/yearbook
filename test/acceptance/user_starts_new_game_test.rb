require 'test_helper'

class UserStartsNewGameTest < Capybara::Rails::TestCase
  # As a user
  # When I visit the root path
  # And I select a cohort
  # And I click Start Game
  # Then I am taken to the new game pa

  def test_it_starts_new_game
    visit root_path

    find(:select, from, options).find(:option, value, options).select_option
    click_button "Start Game"

    assert current_path, new_identification_path
    assert page.has_css?("#photo")
  end
end
