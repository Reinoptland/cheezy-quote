# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

quote_list = [
  ["Academician Prokhor Zakharov", "Begin with a function of arbitrary complexity. Feed it values, "\
    "\"sense data\". Then, take your result, square it, and feed it back into your original function" \
    ", adding a new set of sense data. Continue to feed your results back into the original function" \
    "ad infinitum. What do you have? The fundamental principle of human consciousness"],
  ["Napoleon Bonaparte", "Glory is fleeting, but obscurity is forever."],
  ["Yogi Berra", "In theory, there is no difference between theory and practice. But in practice, there is."],
  ["Friedrich Nietzsche", "There are no facts, only interpretations."],
  ["Dwight D. Eisenhouwer", "A people that values its privileges above its principles soon loses both."],
]

quote_list.each do |source, content|
  Quote.create( source: source, content: content )
end
