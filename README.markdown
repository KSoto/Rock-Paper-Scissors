CURRENT STATUS: Everything works except for one of the tests -[throw_controller_spec](https://github.com/KSoto/Rock-Paper-Scissors/blob/master/spec/controllers/throw_controller_spec.rb)

CPSC 473 - Web Programming and Data Management

Katie Soto

Homework 6

Implement the Sinatra Rock, Paper, Scissors app into a Rails app.



**Deployed at [growing-river-1972.heroku.com](http://growing-river-1972.heroku.com/)**

---------------------------------------------------------------------------------

**Initial steps that should be taken:**

rails new sample_app 

cd sample_app

vi Gemfile *Add these lines:*

       group :development do

  		gem 'rspec-rails', '2.6.1'

	end


	group :test do

  		gem 'rspec-rails', '2.6.1'

  		gem 'webrat', '0.7.1'

	end

bundle install

rails generate rspec:install

git init

git add .

git commit -m "Initial commit"

git remote add origin git@github.com:KSoto/sample_app.git

git push origin master

heroku create

git push heroku master

**rails generate controller throw my_throw**

	changed: config/routes.rb

	added: app/controllers/throw_controller.rb

	added: app/views/throw/my_throw.html.erb

	added: spec/controllers/throw_controller_spec.rb

rails generate controller stats index *(then change routes.rb to 'match' instead)*

rails generate controller clear index *(then change routes.rb to 'match' instead)*

------------testing--------------

git rm -r spec/views

git rm -r spec/helpers

**bundle exec rspec spec/**
