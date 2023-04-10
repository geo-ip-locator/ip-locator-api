# IpLocator

* Application for

* Github Link
  * https://github.com/geo-ip-locator/ip-locator-api

Things you may want to cover:

* Ruby version : 3.2.2

* Rails version : 7.0.4.3

* Bundler version : 2.4.10

* postgresql(psql) version : 15.2

* System dependencies
  * Devise gem
  * jquery-rails gem
  * dotenv-rails gem
  * pg gem
  * i18n gem
  * rspec-rails gem
  * factory_bot_rails gem
  * faker gem
  * database_cleaner gem
  * shoulda-callback-matchers gem
  * shoulda-matchers gem

* Configuration
  * Create .env file from .env.template

        $ cp .env.template .env

* Database creation & initialization
  * Create and migrate database

        $ rails db:create db:migrate

* How to run the project
  * Clone project

        $ git clone https://github.com/geo-ip-locator/ip-locator-api.git
  * Reset Database

        $ rake db:reset
  * Install dependencies

        $ bundle install
  * Start server

        $ rails s
