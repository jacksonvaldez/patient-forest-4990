require 'rails_helper'


RSpec.describe 'Movies index page' do

  before(:each) do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'Marvel Studios', location: 'Hollywood')
    @movie_1 = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: @studio_1.id)
    @movie_2 = Movie.create!(title: 'Iron Man', creation_year: 2003, genre: 'Action', studio_id: @studio_2.id)
    visit '/movies'
  end

  it 'lists links to visit each movies show page' do
    expect(page).to have_link('Raiders of the Lost Ark')
    expect(page).to have_link('Iron Man')
  end

  it 'each link takes you to correct path' do
    click_link('Raiders of the Lost Ark')
    expect(current_path).to eq("/movies/#{@movie_1.id}")
    visit '/movies'
    click_link('Iron Man')
    expect(current_path).to eq("/movies/#{@movie_2.id}")
  end

end
