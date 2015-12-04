describe Movie do
  describe 'searching by director' do
    before :each do
      Movie.create(title: 'Star Wars', rating: 'PG', director: "George Lucas", release_date: '1977-05-25')
      Movie.create(title: 'Blade Runne', rating: 'PG', director: "Ridley Scott", release_date: '1982-06-25')
      #@movie = FactoryGirl.build(:movie,:id => 1, :title=> 'Star Wars', :rating => 'PG', :director => 'George Lucas', :release_date => '1977-05-25', :created_at => '2015-11-28 14:48:56', :updated_at => '2015-11-28 14:48:56')
    end  
    it 'should find movies by same director' do
      #Tmdb::Movie.should_receive(:find).with('Inception')
      
      Movie.director_related_movies(1).each do |movie|
        movie.director.should =="Ridley Scott"
      end
    end
    it 'should not find movies by different directors' do
      Movie.director_related_movies(1).each do |movie|
        movie.director.should_not == 'Ridley Scott'
      end
    end  
    
  end
end
