require 'test_helper'

class UserStartsNewGameTest < Capybara::Rails::TestCase
  def test_it_starts_new_game
    VCR.use_cassette("census_users_index") do
      visit root_path

      assert current_path, new_game_path
      assert Person.count, 0

      click_button "Start Game"

      assert current_path, new_identification_path
      assert page.has_css?("#photo")
      refute_equal Person.count, 0
    end
  end
end
