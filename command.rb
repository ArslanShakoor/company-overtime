#delete the migration file
rails destroy migration create_users
 
#check error in user object
user.errors.full_messages

#generate the file to be migrated
rails generate migration create_users

#migrate the database file
rake db:migrate

#check the routes in rails application
#rake routes

#install the gem
bundle install --without production

#error logs
tail -f log/development.log

#heroku deployment
git push heroku master

#db migrate to  heroku
horoku run rake db:migrate

#make the old commit your new master head
git reset --hard <old commit number>

# after the previous command below command use for remmote push
git push -f origin

 

#gem installer
$ gem install rails-controller-testing

#In your terminal to find out the PID of the process:
$ lsof -wni tcp:3000

#Then, kill the process:
$ kill -9 PID

#command for devise
rails generate devise User

#rails generate model method
rails g model stock ticker:string name:string last_price:decimal

# to create the test database
bundle exec rake db:create

# to migrate the test database
bundle exec rake db:create

#sandbox version of console
rails c --sandbox

# alternative of scaffold
rails g resource Post data:date rationale:text

#update table column
rename_column :table, :old_column, :new_column

# check routes for specific model
rake routes | grep  post

#migration to add relationship
$ rails g migration add_user_to_posts user:references
#create custom rake
rails g task notificatin sms

#create the database again
bundle exec rake db:setup

#heroku css not workin
change deployment.rb file according Overtime project