class MovieActorsController < ApplicationController

  def create
    actor = Actor.search(params[:actor_search]).first
    actor.present? ? ActorMovie.create(actor_id: actor.id, movie_id: params[:id]) : nil
    
    redirect_to("/movies/#{params[:id]}")
  end

end
