require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "clear_all_people" do
    person = Person.new

    assert_equal Person.count, 5

    person.clear_all_people

    assert_equal Person.count, 0
  end

  test "new_game" do
    person = Person.new

    assert_equal Person.count, 5

    person.clear_all_people

    assert_equal Person.count, 0
  end
end
