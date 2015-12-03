Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    
    record = Movie.find_by(title: movie["title"])
    
    if not record
      Movie.create(title: movie["title"], rating: movie["rating"], director: movie["director"], release_date: movie["release_date"])
      
    end
  end
  
end

Then /the director of "Alien" should be "Ridley Scott"/ do
    page.body.should =~ /Ridley Scott/
end

 
Given /^(?:|I )am on the details page for "(.*)"/ do |title|
    record = Movie.find_by(title: title)
    visit movie_path(record)
    
end