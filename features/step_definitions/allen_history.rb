def get_history()
	page.driver.execute_script("
		var ele  = document.getElementById('history');
		return ele.children;")
end

def get_thumbnail_info(ele)
	page.driver.execute_script("
		var ele  = document.getElementById(arguments[0].id);
		var rect = ele.getBoundingClientRect();
    	return [rect.top, rect.bottom];", ele)
end

# def get_thumbnail_bot(ele)
# 	page.driver.execute_script("
# 		var ele  = document.getElementById(arguments[0].id);
# 		var rect = ele.getBoundingClientRect();
#     	return rect.bottom;", ele)
# end

When(/^I see the history bar$/) do
	expect(page.find_by_id('history')).to be_truthy
end

Then(/^I should see the Previous Collage Picker does not show collage currently in the main collage space$/) do
	thumbnails = get_history()
	thumbnails.each do |ele|
		#checks if the element in the history bar is the same picture as main_image
		if ele['src'].eql? page.find_by_id('main_image')['src']
			#this element must not be displayed
			expect(ele.css_value('display')).to eq "none"
		end
	end
end

And(/^I should see the Previous Collage Picker displays all collages in a single horizontal row$/) do
	thumbnails = get_history()
	tops = []
	bots = []
	thumbnails.each do |ele|
		if not ele.css_value('display').eql? "none" #ele is being 
			tops << get_thumbnail_info(ele)[0]
			bots << get_thumbnail_info(ele)[1]
		end
	end
	expect(tops.same_values?).to be true
	expect(bots.same_values?).to be true
end

