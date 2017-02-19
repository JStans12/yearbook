class Identification < ApplicationRecord
  belongs_to :person
  has_many :guesses

  def new_person
    Person.random
  end

  def possibilities(cohort)
    ([person || new_person] + cohort.people.random_set(4)).uniq[0..3].shuffle
  end
end
