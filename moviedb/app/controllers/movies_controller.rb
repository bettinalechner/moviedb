class MoviesController < ApplicationController
    def index
    end
    
    def new
        @movie = Movie.new
    end
    
    def create
       @movie = Movie.new(movie_params)
       
       @movie.save
       
       redirect_to @movie
    end
    
    private
    
    def movie_params
        params.require(:movie).permit(:title, :year, :rating, :description)
    end
end
