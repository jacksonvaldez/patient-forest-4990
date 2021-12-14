require 'rails_helper'

RSpec.describe 'Movie Show Page' do

  before(:each) do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'Marvel Studios', location: 'Hollywood')
    @movie_1 = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: @studio_1.id)
    @movie_2 = Movie.create!(title: 'Iron Man', creation_year: 2003, genre: 'Super Hero', studio_id: @studio_2.id)
    @actor_1 = Actor.create!(name: 'Example Name', age: 75)
    @actor_2 = Actor.create!(name: 'Sarah Adams', age: 14)
    @actor_3 = Actor.create!(name: 'John Doe', age: 105)
    ActorMovie.create!(actor_id: @actor_1.id, movie_id: @movie_1.id)
    ActorMovie.create!(actor_id: @actor_2.id, movie_id: @movie_1.id)
    ActorMovie.create!(actor_id: @actor_3.id, movie_id: @movie_2.id)
    visit "/movies/#{@movie_1.id}"
  end

  it 'displays movie attributes' do
    expect(page).to have_content('Raiders of the Lost Ark')
    expect(page).to have_content('1981')
    expect(page).to have_content('Action/Adventure')
  end

  it 'doesnt display the other movies attributes' do
    expect(page).to_not have_content('Iron Man')
    expect(page).to_not have_content('2003')
    expect(page).to_not have_content('Super Hero')
  end

  it 'displays the actors in the movie' do
    expect(page).to have_content('Example Name')
    expect(page).to have_content('Sarah Adams')
  end

  it 'doesnt display actors not in the movie' do
    expect(page).to_not have_content('John Doe')
  end

  it 'displays the actors in the movie from youngest to oldest' do
    expect('Sarah Adams').to appear_before('Example Name')
  end

  it 'displays the average age of the actors as an integer' do
    expect(page).to have_content('Average Age: 44')
  end

  it 'displays a form to add an actor to the movie' do
    expect(page).to have_field(:actor_search)
  end

  it 'takes you to correct path after adding an actor' do
    fill_in(:actor_search, with: 'John Doe')
    click_button('Add Actor')
    expect(current_path).to eq("/movies/#{@movie_1.id}")
  end

  it 'lists the actor added' do
    fill_in(:actor_search, with: 'John Doe')
    click_button('Add Actor')
    expect(page).to have_content('John Doe')
  end

  it 'doesnt list an actor added if actor doesnt exist' do
    fill_in(:actor_search, with: 'BLA BLA BLA')
    click_button('Add Actor')
    expect(page).to_not have_content('BLA BLA BLA')
  end

end
