require 'spec_helper'
require 'rails_helper'
 
describe MoviesController do
  describe 'When the specified movie has a director,' do
    before :each do
      @fake_results = [mock('movie1'), mock('movie2')]
      
    end
    it 'should call the model method that find movies by same director' do
    
      
      allow(Movie).to receive(:director_related_movies).with("George Lucas").and_return(@fake_results)
      
      #get :search_director_movies, {:related => 1}
    end
  end  
  describe 'After valid filter' do  
    before :each do
      Movie.stub(:director_related_movies).and_return(@fake_results)
      Movie.create(title: 'Star Wars', rating: 'PG', director: "George Lucas", release_date: '1977-05-25')
      Movie.create(title: 'Blade Runne', rating: 'PG', director: "Ridley Scott", release_date: '1982-06-25')
      get :search_director_movies, {:related => 1}
      
    end
    
    it 'should select the related movies template for rendering' do
      expect(response).to render_template('search_director_movies')
      
    end  
    
    it 'should make the TMDb search results available to that template' do
      expect(assigns(:movies)).to be @fake_results
    end
    
  end
  describe 'When the specified movie has no director' do
    before :each do
      
    end  
    it 'should not call the model method that find movies by same director' do
      Movie.should_not_receive(:director_related_movies).with("")
    end  
      
  end
  
    
end

