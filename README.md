# Overtime App
It is data driven enterprise app using potgres db and Rails framework to track ovetime of employees. The whole application is based upon TDD/BDD approach. All the details are belows 

## Gems used in Application

### devise
Used `devise` gem for user registeration and authentication

### pundit
used `pundit` gem for user authorization

### administrate
used `administrate` gem for admin panel for admin users

### Toastr-Rails
used `toastr-rails` for growl type notification

### Bootstrap-sass
used `bootstrap-sass` for bootstrap 3 style implementation


## APIs Used in Application
Following API used and api keys are secured by `dotenv-rails` gem

### Twilio 
used `Twili`o api to send the message to employees about logs

### SparkPost
used `sparkpost` api to send the emails to Managers(Admins)

## Testing Approach
As i always love to create apps Using TDD and BDD  approach so i used the following testing mechanisms used to create 30 tests
for this application 

### SPecR
used `SpecR` for TDD

### Capybara
uaed `Capybara` for BDD

### FactoryGirl
To help produce test data more easily used Factory Girl

## Pending Features
using the Rails 5 great feature `Action Cable` create the chat feature for employees to interact



