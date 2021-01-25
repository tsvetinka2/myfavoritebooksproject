Feature: search for books by author
 
  As a book lover
  So that I can find books with my favorite author
  I want to include and search on author information in books I enter
 
Background: books in database
 
  Given the following books exist:
  | title                 | genre           | author       | publish_date | isbn_number  |
  | It                    | Horror          | Stephen King |   1986-09-15 | 123-123-1234 |
  | The Martian           | Science fiction | Andy Weir    |   2014-02-11 | 987-654-3210 |
  | To Kill A Mockingbird | Drama           |              |   1960-07-11 |              |
  | Carrie                | Horror          | Stephen King |   1974-04-05 | 975-310-9876 |
 
Scenario: add author to existing book
  When I go to the edit page for "To Kill A Mockingbird"
  And  I fill in "Author" with "Harper Lee"
  And  I press "Update Book Info"
  Then the author of "To Kill A Mockingbird" should be "Harper Lee"
 
Scenario: find book with same author
  Given I am on the details page for "It"
  When  I follow "Find Books With Same Author"
  Then  I should be on the Similar Books page for "It"
  And   I should see "Carrie"
  But   I should not see "The Martian"
 
Scenario: can't find similar books if we don't know author (sad path)
  Given I am on the details page for "To Kill A Mockingbird"
  Then  I should not see "Harper Lee"
  When  I follow "Find Books With Same Author"
  Then  I should be on the home page
  And   I should see "'To Kill A Mockingbird' has no author info"

