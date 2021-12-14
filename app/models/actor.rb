class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.search(search_params)
    where("name ILIKE ?", "%#{search_params}%")
  end

end
