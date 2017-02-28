class Identification < ApplicationRecord
  belongs_to :person
  has_many :guesses

  def new_person
    Person.random
  end

  def possibilities(cohort)
    possibilities = [person] + (cohort.people - [person]).shuffle.last(3)
    possibilities.shuffle
  end
end
