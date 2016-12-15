class Person < ApplicationRecord
  belongs_to :cohort
  has_many :identifications

  def self.random
    random_set(1).first
  end

  def self.random_set(quantity)
    limit(quantity).order("RANDOM()")
  end

  def clear_all_people
    Person.destroy_all
  end

  
end
