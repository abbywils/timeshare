require 'spec_helper'
require 'rails_helper'
require 'integration_helper'

feature 'search site listings' do
  

    scenario "one field search" do
        login_as_admin
        
        visit '/timeshare/index'
        expect(page).to have_content('Welcome to Heritage Timeshare!')
        
        select "Afghanistan", :from => "Country"
        click_button 'Search'
        expect(page).to have_content('Minaret and Archaeological Remains of Jam')
    end


    scenario "multiple field search" do
        login_as_admin
        
        visit '/timeshare/index'
        expect(page).to have_content('Welcome to Heritage Timeshare!')
        
        select "Tunisia", :from => "Country"
        select "Cultural", :from => "Site Type"
        click_button 'Search'
        expect(page).to have_content('Medina of Tunis')
    end
    
    
        scenario "search returns no results" do
        login_as_admin
        
        visit '/timeshare/index'
        expect(page).to have_content('Welcome to Heritage Timeshare!')
        
        select "Argentina", :from => "Country"
        select "Mixed", :from => "Site Type"
        click_button 'Search'
        expect(page).to have_content('sorry no sites match those search criteria!')
    end
    
    
end