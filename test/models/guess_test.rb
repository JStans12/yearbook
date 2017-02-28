require "test_helper"

describe Guess do

  test "correct" do
    person = Person.create(first_name: "name4",
                  last_name: "last4",
                  photo_url: "http://s3./first_last.jpg?14875987399")
    identification = Identification.create(person: person)
    guess = Guess.create(hypothesis: person.first_name, identification: identification)

    assert guess.correct?
  end

end
