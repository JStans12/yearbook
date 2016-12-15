require 'test_helper'

class GuestIdentifiesPeopleTest < Capybara::Rails::TestCase
  def test_it_reaches_a_new_identification
    visit '/identifications/new'
    assert_equal 200, page.status_code
  end

  def test_a_correct_guess
    visit '/identifications/new'
    answer = page.find('#answer').text
    page.click_link_or_button(answer)

    assert_equal 200, page.status_code
    assert page.has_content?("Correct: #{answer}")
  end

  def test_a_wrong_guess_redisplays_the_guess_page
    visit '/identifications/new'
    answer = page.find('#answer').text

    wrong_name = "blahblah"

    within('#possibilities') do
      wrong_name = page.find_all('a').detect{|link| link.text != answer }.text
      page.click_link_or_button(wrong_name)
    end

    assert_equal 200, page.status_code
    assert page.has_content?("Try Again")
    assert_equal answer, page.find('#answer').text
  end

end
