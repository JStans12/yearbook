class Identification < ApplicationRecord
  belongs_to :person
  has_many :guesses

  def person
    @person ||= Person.random
  end

  def possibilities
    ([person] + Person.random_set(3)).uniq[0..2].shuffle
  end
end
