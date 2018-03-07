
def topic_top()
	page.driver.evaluate_script <<-EOS
		function() {
		var ele  = document.getElementById('topic');
		var rect = ele.getBoundingClientRect();
		return rect.top;
		}();
	EOS
end

def image_top()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('main_image');
    	var rect = ele.getBoundingClientRect();
    	return rect.top;
  	}();
	EOS
end

def input_top()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('input');
    	var rect = ele.getBoundingClientRect();
    	return rect.top;
  	}();
	EOS
end

def history_top()
	page.driver.evaluate_script <<-EOS
  	function() {
    	var ele  = document.getElementById('history');
    	var rect = ele.getBoundingClientRect();
    	return rect.top;
  	}();
  	EOS
end


Given(/^I am on the Collage page$/) do
  visit "http://localhost:8080/Implementation/collage.html"
end

Then(/^I should see the search box with placeholder text "([^"]*)"$/) do |placeholdertext|
  expect(find_field('text_input')['placeholder']).to eq placeholdertext
end

And(/^I should see the title at the top of the page$/) do
	posTopic = topic_top()

	posImage = image_top()

	# NEED TO CHECK FOR BUILD ANOTHER BUTTON

	posInput = input_top()

	posHistory = history_top()

	expect(posTopic).to be < posImage
	expect(posTopic).to be < posInput
	expect(posTopic).to be < posHistory
end

And(/^I should see the collage underneath the title$/) do
	posTopic = topic_top()

	posImage = image_top()

	# NEED TO CHECK FOR BUILD ANOTHER BUTTON

	posInput = input_top()

	posHistory = history_top()

	expect(posImage).to be > posTopic
	expect(posImage).to be < posInput
	expect(posImage).to be < posHistory
end

When(/^I enter "([^"]*)" in the search box$/) do |searchArg|
  fill_in('text_input', :with => searchArg)
end

When(/^press search$/) do
  # find_field('text_input').native.send_key(:enter)
end

Then(/^I should see the title change for "([^"]*)"$/) do |arg1|
  # expect(page.find_by_id('topic').text).to eq "Collage for Topic " + arg1
end

