require 'rails_helper'


RSpec.describe 'Studios index page' do

  before(:each) do
    @studio_1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    @studio_2 = Studio.create!(name: 'Marvel Studios', location: 'Hollywood')
    @movie_1 = Movie.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure', studio_id: @studio_1.id)
    @movie_2 = Movie.create!(title: 'Iron Man', creation_year: 2003, genre: 'Action', studio_id: @studio_2.id)
    visit '/studios'
  end

  it 'lists all studio names' do
    save_and_open_page
    expect(page).to have_content('Universal Studios')
    expect(page).to have_content('Marvel Studios')
  end

  it 'lists the movies of each studio' do
    expect(page).to have_content('Raiders of the Lost Ark')
    expect(page).to have_content('Iron Man')
  end

end
