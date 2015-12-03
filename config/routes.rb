Rottenpotatoes::Application.routes.draw do
  
  get 'movies/search_director_movies/:related/related_movies' , :to => 'movies#search_director_movies', :as => 'find_all_by_director'
  
  
  resources :movies
  
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
  
end
