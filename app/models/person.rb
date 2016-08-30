class Person < ApplicationRecord
  belongs_to :cohort

  def self.random
    random_set(1).first
  end

  def self.random_set(quantity)
    limit(quantity).order("RANDOM()")
  end
end
