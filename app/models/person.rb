class Person < ApplicationRecord
  belongs_to :cohort
  has_many :identifications

  def self.new_game
    person = Person.new
    person.clear_all_people
    person.load_people
  end

  def self.random
    random_set(1).first
  end

  def self.random_set(quantity)
    limit(quantity).order("RANDOM()")
  end

  def self.random_person_with_image
    where.not(photo_url: "https://turing-census.herokuapp.com/images/original/missing.png").order("RANDOM()").limit(1)
  end

  def clear_all_people
    Person.destroy_all
  end

end
