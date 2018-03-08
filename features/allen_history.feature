Feature: checking requirements for history bar
	
Background:
	Given I am on the Collage page

Scenario: Single row
	When I see the history bar
	Then I see all the previous collages displayed in a single horizontal row

