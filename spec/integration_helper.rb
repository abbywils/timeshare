def login_as_admin
    visit '/login'
    expect(page).to have_content('Log in')

    fill_in 'Email',:with=>'abbywils@hawaii.edu'
    fill_in 'Password',:with=>'sadsam'
    click_button 'Log in'
end

def login_as_normal
    visit '/login'
    expect(page).to have_content('Log in')

    fill_in 'Email',:with=>'bruce@awad.com'
    fill_in 'Password',:with=>'iloveagile'
    click_button 'Log in'
end


def seed_admin
    system("rake parsing:seed_admin RAILS_ENV=test")
end


def seed_normal
    system("rake parsing:seed_normal RAILS_ENV=test")
end


def reset_db
    system("rake db:migrate:reset RAILS_ENV=test") 
end

def seed_everything
    system("rake parsing:seed_everything RAILS_ENV=test")
end