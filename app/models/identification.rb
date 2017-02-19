class Identification < ApplicationRecord
  belongs_to :person
  has_many :guesses

  def new_person
    Person.random
  end

  def possibilities(cohort)

    # ([person] + cohort.people.random_set(4)).uniq[0..3].shuffle
    ([person] + cohort.people.shuffle.last(3))
  end
end
