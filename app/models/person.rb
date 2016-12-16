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

  def clear_all_people
    Person.destroy_all
  end

  def load_people
    CensusApiService.fetch_people.each do |person|
      cohort = Cohort.find_or_create_by(name: person["cohort"])
      cohort.people.create(
      first_name: person["first_name"],
      last_name: person["last_name"],
      photo_url: person["image_url"]
      )
    end
  end
end
