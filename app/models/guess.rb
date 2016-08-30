class Guess < ApplicationRecord
  belongs_to :identification

  def correct?
    hypothesis == identification.person.first_name
  end
end
