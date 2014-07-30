require 'spec_helper'

feature 'Visit Home' do
  scenario 'User visits home' do
    visit '/'

    expect(page).to have_title('Reeder')
  end
end
