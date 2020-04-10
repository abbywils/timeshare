require 'spec_helper'
require 'rails_helper'
require 'integration_helper'

feature 'user login' do
  
  
    scenario "registered user login" do
        login_as_admin
        expect(page).to have_content('Welcome to Heritage Timeshare!')
    end
    
    
    scenario "incorrect password" do
        visit '/login'
        expect(page).to have_content('Log in')
        fill_in 'Email',:with=>'abbywils@hawaii.edu'
        fill_in 'Password',:with=>'happysam'
        click_button 'Log in'
        expect(page).to have_content('Invalid email/password combination')
    end
    
    
    scenario "unregistered user login" do
        visit '/login'
        expect(page).to have_content('Log in')
        fill_in 'Email',:with=>'unregistered@user.com'
        fill_in 'Password',:with=>'something'
        click_button 'Log in'
        expect(page).to have_content('Invalid email/password combination')
    end
    
    
end

# rake db:migrate:reset development:seed_everything development:seed_admin development:seed_normal RAILS_ENV=test