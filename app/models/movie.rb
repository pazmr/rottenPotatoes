class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  def self.director_related_movies(id)
    movie_selected = find(id)
    where(director: movie_selected.director).all
    
  end  
end
