require 'spec_helper'
require 'rails_helper'
require 'integration_helper'

feature 'admin dashboard' do
  

    scenario "add new user" do
        login_as_admin
        
        click_link 'Admin Dashboard'
        expect(page).to have_content('Users')
        expect(page).to have_content('Reservations')
        

        click_link 'New User'
        
        expect(page).to have_content('New User')
    end
    
    
    
    scenario "edit user" do
        login_as_admin
        
        visit '/users/1/edit'
        
        expect(page).to have_content('Editing User')
        fill_in 'Name',:with=>'Abby Wilson'
        fill_in 'Email',:with=>'abbywils@hawaii.edu'
        fill_in 'Address',:with=>'252 Union Grove'
        fill_in 'Postcode',:with=>'AB10 6TS'
        fill_in 'Password',:with=>'sadsam'
        fill_in 'password confirmation',:with=>'sadsam'

        click_button 'Update'
        
        expect(page).to have_content('User was successfully updated.')
    end
    
    

    scenario "add new reservation" do
        login_as_admin
        
        visit '/users'
        expect(page).to have_content('Users')
        expect(page).to have_content('Reservations')
        

        click_link 'New Reservation'
        
        expect(page).to have_content('New Reservation')
    end
    
    
    
end