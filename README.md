[ ![Codeship Status for Reinoptland/cheezy-quote](https://app.codeship.com/projects/b21a2b60-897b-0135-396b-4ea0e6564655/status?branch=master)](https://app.codeship.com/projects/248649)

# :full_moon: Cheezy-quote :full_moon:

Cheezy-quote is an app that inspires you with deliciously cheesy quotes!

# Features

### For Users
* Displays random quotes or a list of all quotes in the database
* Admin functionality to add quotes or edit/destroy existing ones
* Search function

### For Maintainers
* Tested with RSpec
* Continuous Integration through Codeship
  * All branches pushed to this repository are automatically tested.
  * This app deploys on heroku. The master branch is automatically tested and deploys upon passing the test suite.
* Automatically generated documentation using YARD


# Setting up

* Ruby version
  * 2.4.2
* Rails version
  * 5.1.4

* Installation
  1. Run bundle install ->  
    ```
    bundle install
    ```
  2. Create, load schema and seed the database ->
    ```  
    rake db:setup
    ```
  3. Install and start elasticsearch ->
    ```  
    brew install elasticsearch

    elasticsearch
    --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml
    ```
  4. Import data from your models into elastic search->
    ```  
    bundle exec rake environment elasticsearch:import:model CLASS='Quote'
    ```
* Tests


  This app is tested with Rspec to run the tests use ->
  ```
  bundle exec rspec
  ```

* Documentation


  The documentation for this app is automatically generated using yard.
  To generate the documentation on your local machine use ->
  ```
  yard doc
  ```

* Services
  * The search functionality is powered by elasticsearch-rails. For more information visit [their github repository](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-rails)


* Deployment instructions

  If you want to deploy your own version use [this guide](https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up) provided here by heroku:
