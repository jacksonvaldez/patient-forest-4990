require 'rails_helper'

RSpec.describe 'Welcome Page' do

  before(:each) do
    visit '/'
  end

  it 'should have welcome text' do
    expect(page).to have_content('Welcome!')
  end

  describe 'View Studios link' do
    it 'has a link to visit studios index page' do
      expect(page).to have_link('View Studios')
    end
    it 'takes you to the correct path' do
      click_link('View Studios')
      expect(current_path).to eq('/studios')
    end
  end

  describe 'View Movies link' do
    it 'has a link to visit movies index page' do
      expect(page).to have_link('View Movies')
    end
    it 'takes you to the correct path' do
      click_link('View Movies')
      expect(current_path).to eq('/movies')
    end
  end

end
