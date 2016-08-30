class Identification < ApplicationRecord
  belongs_to :person
  has_many :guesses

  def new_person
    Person.random
  end

  def possibilities
    ([person || new_person] + Person.random_set(3)).uniq[0..2].shuffle
  end
end
