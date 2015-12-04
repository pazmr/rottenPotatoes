Feature: create movies
 
  As an avid moviegoer
  So that I can quickly add a movie
  I want to see the movie


Background: movies have been added to database
  
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

  And I am on the RottenPotatoes home page

Scenario: create the movie
  When I follow "Add new movie"
  And  I fill in "Title" with "La llamita Blanca"
  And  I press "Save Changes"
  Then I should see "La llamita Blanca"


