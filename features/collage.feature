Feature: Checking css on collage page

Background:

	Given I am on the Collage page
	Then I should see the search box with placeholder text "Enter Topic"
	And I should see the title at the top of the page
	And I should see the collage underneath the title

Scenario: search on Collage page

	When I enter "William Halfond" in the search box
	And press search
	Then I should see the title change for "William Halfond"



