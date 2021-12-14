require 'rails_helper'

RSpec.describe 'Welcome Page' do
  before(:each) do
    visit '/'
  end
  it 'should have welcome text' do
    expect(page).to have_content('Welcome!')
  end
end
