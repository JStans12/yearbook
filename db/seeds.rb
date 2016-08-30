# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image_root = "./app/assets/images"

Person.destroy_all
Identification.destroy_all
Guess.destroy_all

Dir.glob(image_root + '/*/*.jpg') do |file_path|
  puts file_path.inspect
  parts = file_path.split('/')
  cohort_name = parts[4]
  names = parts[5].split(" ")
  first_name = names[0]
  last_name = names[1].split(".jpg").first
  cohort = Cohort.find_or_create_by(:name => cohort_name)
  p = cohort.people.new(:first_name => first_name,
                        :last_name => last_name,
                        :photo_url => parts[4] + "/" + parts[5])
  p.save!
end
