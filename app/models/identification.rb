class Identification < ApplicationRecord
  has_one :person

  def initialize
    @person ||= Person.random
  end

  def possibilities
    (Person.random_set(3)).shuffle
  end
end
