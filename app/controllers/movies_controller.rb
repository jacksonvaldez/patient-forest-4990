class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @movie_actors = @movie.actors_by_age
    @average_age = @movie.average_age
  end

end
