Given(/^I am on the Collage page$/) do
  visit "http://localhost:8080/Implementation/collage.html"
end

Then(/^I should see the search box with placeholder text "([^"]*)"$/) do |placeholdertext|
  expect(find_field('text_input')['placeholder']).to eq placeholdertext
end

When(/^I enter "([^"]*)" in the search box$/) do |searchArg|
  fill_in('text_input', :with => searchArg)
end

When(/^press search$/) do
  find_field('text_input').native.send_key(:enter)
end

Then(/^I should see the title change for "([^"]*)"$/) do |arg1|
  expect(page.find_by_id('topic').text).to eq "Collage for Topic " + arg1
end

