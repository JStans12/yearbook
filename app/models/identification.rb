class Identification < ApplicationRecord
  belongs_to :person
  has_many :guesses

  def new_person
    Person.random
  end

  def possibilities
    ([person || new_person] + Person.random_set(4)).uniq[0..3].shuffle
  end
end
