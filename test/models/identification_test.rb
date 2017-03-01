require 'test_helper'

class IdentificationTest < ActiveSupport::TestCase

  test "possibilities" do
    cohort = Cohort.create(name: "1608")
    cohort.people.create(first_name: "name",
                         last_name: "last",
                         photo_url: "http://s3./first_last.jpg?14875987399")
    cohort.people.create(first_name: "name2",
                         last_name: "last2",
                         photo_url: "http://s3./first_last.jpg?14875987399")
    cohort.people.create(first_name: "name3",
                         last_name: "last3",
                         photo_url: "http://s3./first_last.jpg?14875987399")
    cohort.people.create(first_name: "name4",
                         last_name: "last4",
                         photo_url: "http://s3./first_last.jpg?14875987399")
    person = cohort.people.create(first_name: "name4",
                        last_name: "last4",
                        photo_url: "http://s3./first_last.jpg?14875987399")
    identification = Identification.create(person: person)

    poss = identification.possibilities(cohort)
    assert_equal 4, poss.length
    assert poss.include?(person)
  end
end
