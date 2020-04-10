require 'spec_helper'
require 'rails_helper'
require 'integration_helper'

feature 'checkout' do
  

    scenario "all fields correct" do
        login_as_normal
        
        visit '/sites/97'
        expect(page).to have_content('Historic Centre of the Town')

        click_button 'Add To Cart'
        
        expect(page).to have_content('Please complete the form below to checkout')

        fill_in 'Cardnumber',:with=>'1234123412341234'
        fill_in 'Expirydate',:with=>'01/23'
        fill_in 'Name',:with=>'A.N.Other'
        fill_in 'Cardtype',:with=>'Visa'

        click_button 'Checkout'

        expect(page).to have_content('Checkout successful. You will receive a confirmation email shortly')
    end
    
    
    
    scenario "invalid card number entered" do
        login_as_normal
        
        visit '/sites/279'
        expect(page).to have_content('Asmara: A Modernist African City')

        click_button 'Add To Cart'
        
        expect(page).to have_content('Please complete the form below to checkout')

        fill_in 'Cardnumber',:with=>'12341234123412'
        fill_in 'Expirydate',:with=>'01/23'
        fill_in 'Name',:with=>'A.N.Other'
        fill_in 'Cardtype',:with=>'Visa'

        click_button 'Checkout'

        expect(page).to have_content('Checkout failed (invalid card number)')
    end

end