require 'spec_helper'
require 'rails_helper'
require 'integration_helper'

feature 'custom menu display' do
  
  
    scenario "for admin" do
        login_as_admin
        expect(page).to have_content('Admin Dashboard')
    end
    
    
    scenario "for normal user" do
        login_as_normal
        expect(page).to have_content('Log out','My Account')
    end
    
    
    scenario "before login" do
        visit '/login'
        expect(page).to have_content('Log in')
    end
    
  
  
end