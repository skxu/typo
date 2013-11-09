Feature: Create new categories and edit existing categories


    Background:
        Given the blog is set up
        And I am logged into the admin panel
        When I follow "Categories"
        
    Scenario: Categories page correctly displays
        Then I should see "Categories"
        And I should see "Permalink"
        And I should see "General"
    
    Scenario: Create new category
        When I fill in "Name" with "Test Category"
        And I fill in "Keywords" with "key1,key2"
        And I fill in "Description" with "This is a test category"
        And I press "Save"
        Then I should see "Test Category"
        And I should see "key1,key2"
        And I should see "This is a test category"
        And I should see "no articles"
        
    Scenario: Edit existing category
        When I follow "General"
        Then I fill in "Description" with "Edited General Description"
        And I press "Save"
        Then I should see "Edited General Description"
