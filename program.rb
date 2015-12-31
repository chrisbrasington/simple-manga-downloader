require 'mechanize'

test_url = "http://kissmanga.com/Manga/Seikai-no-Monshou-YONEMURA-Kouichirou"

mechanize = Mechanize.new
page = mechanize.get(test_url)

puts page.title