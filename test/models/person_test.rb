require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "new_game" do
    person = Person.new

    assert_equal Person.count, 5

    person.clear_all_people

    assert_equal Person.count, 0
  end

  test "random" do
    random = Person.random

    assert_instance_of Person, random
  end

  test "random set" do
    set = Person.random_set(2)

    assert_equal set.length, 2
    assert_instance_of Person, set[0]
  end

  test "random_person_with_image" do
    random_person = Person.random_person_with_image
    missing = "https://turing-census.herokuapp.com/images/original/missing.png"

    refute_equal random_person[0].photo_url, missing
  end

  test "clear_all_people" do
    person = Person.new

    assert_equal Person.count, 5

    person.clear_all_people

    assert_equal Person.count, 0
  end
end
