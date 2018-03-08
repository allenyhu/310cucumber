def get_history()
	page.driver.evaluate_script <<-EOS
		function() {
		var ele  = document.getElementById('history');
		return ele.children;
		}();
	EOS
end

Then(/^I see all the previous collages displayed in a single horizontal row$/) do
	thumbnails = get_history()
	p thumbnails
end