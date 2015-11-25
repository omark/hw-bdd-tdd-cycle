# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie) unless Movie.exists?(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |title,director|
  expect(Movie.where(:title => title).pluck(:director)[0]).to eq(director)
end

Then /I should see "(.*)" has no director info/ do |title|
  regexp = /\s#{title}\s\w\s[0-9]/
  expect(page).to have_content regexp
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  regexp = /#{e1}.*#{e2}/m
  expect(page).to have_content regexp
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  fail "Unimplemented"
end

Then /I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
  fail "Unimplemented"
end
