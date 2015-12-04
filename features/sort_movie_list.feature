Feature: display list of movies sorted by different criteria
 
  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

Background: movies have been added to database
  
  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page

Scenario: sort movies alphabetically
  When I follow "Movie Title"
  Then I should see "Aladdin" before "Amelie" 

Scenario: sort movies in increasing order of release date
  When I follow "Release Date"
  Then I should see "2001: A Space Odyssey" before "Raiders of the Lost Ark"
#Feature: display list of movies filtered by MPAA rating
 
#  As a concerned parent
#  So that I can quickly browse movies appropriate for my family
#  I want to see movies matching only certain MPAA ratings


Scenario: restrict to movies with 'PG' or 'R' ratings
  # enter step(s) to check the 'PG' and 'R' checkboxes
  Given I check the following ratings: PG, R
  # enter step(s) to uncheck all other checkboxes
  And I uncheck the following ratings: G, PG-13, NC-17
  # enter step to "submit" the search form on the homepage
  And I press "Refresh"
  # enter step(s) to ensure that PG and R movies are visible
  Then I should see "The Incredibles"
  And I should see "The Terminator"
  # enter step(s) to ensure that other movies are not visible
  But I should not see "2001: A Space Odyssey"
  And I should not see "The help"
  
Scenario: all ratings selected
  Given I check the following ratings: PG, R, G, PG-13, NC-17
  And I press "Refresh"
  Then I should see all the movies

#End filter