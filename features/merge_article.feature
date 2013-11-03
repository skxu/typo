Feature: Merge Articles
	As a blog administrator
	In order to combine my previous posts
	I want to be able to merge existing articles
	
	Background:
	Given the blog is set up
	And I am logged into the admin panel
	Given I am on the new article page
	When I fill in "article_title" with "Foobar"
	And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
	And I press "Publish"
	Then I should be on the admin content page
	
	Given I am on the new article page
	When I fill in "article_title" with "Boofar"
	And I fill in "article__body_and_extended_editor" with "Bootleg foobarf"
	And I press "Publish"
	Then I should be on the admin content page
	
	Scenario: A non-admin cannot merge two articles
	  Given I am logged into the user panel
	  When I go to the admin content page
	  And I follow "Foobar"
	  Then I should not see "Merge" button
	  
	Scenario: An admin can merge two articles
	  Given I log into the admin panel
	  When I go to the admin content page
	  And I follow "Foobar"
	  Then I should see "Merge" button
	
	Scenario: When articles are merged, the merged article should contain the text of both previous articles
	  Given I log into the admin panel
	  When I go to the admin content page
	  And I follow "Foobar"
	  When I fill in "merge_with" with "4"
	  And I press "Merge"
	  And I follow "Foobar"
	  Then I should see "Lorem Ipsum"
	  And I should see "Bootleg foobarf"
	  
	Scenario: When articles are merged, the merged article should have one author (either one of the authors of the original article)
	  Given I log into the admin panel
	  When I go to the admin content page
	  And I follow "Foobar"
	  When I fill in "merge_with" with "4"
	  And I press "Merge"
	  Then I should see one author
	
	
	Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article
	  Given I log into the admin panel
	  When I go to the admin content page
	  And I follow "Foobar"
	  When I fill in "merge_with" with "4"
	  And I add comments
	  And I press "Merge"
	  Then I should see merged comments
	
	
	Scenario: The title of the new article should be the title from either one of the merged articles
	  Given I log into the admin panel
	  When I go to the admin content page
	  And I follow "Foobar"
	  When I fill in "merge_with" with "4"
	  And I press "Merge"
	  And show me the page
	  Then I should see one title
	
	
	
	
	
