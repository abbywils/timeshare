require 'spec_helper'
require 'rails_helper'
require 'integration_helper'

feature 'add item to cart' do
  

    scenario "from site listing" do
        login_as_normal
        
        visit '/sites/29'
        expect(page).to have_content('Willandra Lakes Region')

        click_button 'Add To Cart'
        expect(page).to have_content('Item has been added to your cart')
        expect(page).to have_content('Checkout')
        expect(page).to have_content('remove item')
    end

end