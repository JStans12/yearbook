class Identification
  # belongs_to :person
  # has_many :guesses
  attr_reader :person

  def initialize(person)
    @person = person
  end

  # def new_person
  #   Person.random
  # end

  def possibilities(cohort)
    [person] + (cohort.people - [person]).shuffle.last(3)
  end
end
