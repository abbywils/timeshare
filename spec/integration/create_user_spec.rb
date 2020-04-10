require 'spec_helper'
require 'rails_helper'

feature 'create user' do
  
  
  scenario "register new user" do
      visit'/users/new'
      expect(page).to have_content('New User')
      
      fill_in 'Name',:with=>'Penelope Rose'
      fill_in 'Email',:with=>'penny@gmail.com'
      fill_in 'Address',:with=>'54 Union Lane'
      fill_in 'Postcode',:with=>'AB10 7TF'
      fill_in 'Password',:with=>'gingercat29'
      fill_in 'password confirmation',:with=>'gingercat29'
      click_button 'Create User'
      expect(page).to have_content('Name: Penelope Rose')
      expect(page).to have_content('Email: penny@gmail.com')
      expect(page).to have_content('Address: 54 Union Lane')
      expect(page).to have_content('Postcode: AB10 7TF')
  end
  
  
  scenario "register error" do
      visit'/users/new'
      expect(page).to have_content('New User')
      
      click_button 'Create User'
      expect(page).to have_content("errors prohibited this user from being saved")
  end
  
  
  scenario "password mismatch" do
      visit'/users/new'
      expect(page).to have_content('New User')
      
      fill_in 'Name',:with=>'Lois Powell '
      fill_in 'Email',:with=>'lois@gmail.com'
      fill_in 'Password',:with=>'gingercat29'
      fill_in 'password confirmation',:with=>'gingercat28'
      click_button 'Create User'
      expect(page).to have_content("Password confirmation doesn't match Password")
  end

end