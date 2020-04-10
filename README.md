# Heritage Timeshare ## 

This is a Ruby on Rails app based on open data on World Hertiage Sites from UNESCO. The data can be found at https://old.datahub.io/dataset/unesco-world-heritage-sites/resource/d4116195-44d8-4bc1-9f91-9b570870dc19 . The app was developed in AWS Cloud 9 with the following versions:

>Ruby 2.6.3  
>Rails 5.2.4

**This app was created by Abby Othman Wilson (51877212) for AWAD in April 2020.**




## See me running live ##

A live version of *Heritage Timeshare* is deployed on Heroku, and can be accessed using the following link:

> https://heritage-timeshare.herokuapp.com 

**To login, you can sign in using the admin account:**

Email: abbywils@hawaii.edu
Password: sadsam

**or as a regular user:**

Email: bruce@awad.com
Password: iloveagile




## Running the application locally ##

If the sqlite3 database isn't already present, then run bundle install:

>$ bundle install

Then seed the database using:

>$ rake parsing:seed_everything

Then add the administrator account if required:

>$ rake parsing:seed_admin

Access the application using:http://localhost:3000




## Git log ##

The git log can be found in the local file:

> commits.local.tsv.txt 

The github repository is at:

> https://github.com/abbywils/timeshare


