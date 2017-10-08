[ ![Codeship Status for Reinoptland/cheezy-quote](https://app.codeship.com/projects/b21a2b60-897b-0135-396b-4ea0e6564655/status?branch=master)](https://app.codeship.com/projects/248649)

# :full_moon: Cheesy-Quote :full_moon:

Cheesy-Quote is an app that inspires you with deliciously cheesy quotes!

# Features

### For Users
* Displays random quotes or a list of all quotes in the database
* Admin functionality to add quotes or edit/destroy existing ones
* Search function powered by ElasticSearch
* Quotes are scored on a CheesyScale™ that indicate how cheesy they are

### For Maintainers
* Tested with RSpec
* Continuous Integration through Codeship
  * All branches pushed to this repository are automatically tested.
  * This app deploys on heroku. The master branch is automatically tested and deploys upon passing the test suite.
* Automatically generated documentation using YARD


# Setting up (local)

* Ruby version
  * 2.4.2
* Rails version
  * 5.1.4


## Installation
  0. **Clone the repository**
  1. **Run bundle install** ->  
    ```
    bundle install
    ```

  2. **Create, load schema and seed the database** ->
    ```  
    rake db:setup
    ```

  3. **Install and start elasticsearch** ->
    ```  
    brew install elasticsearch

    elasticsearch
    --config=/usr/local/opt/elasticsearch/config/elasticsearch.yml
    ```

  4. **Import data from your models into elastic search** ->
    ```  
    bundle exec rake environment elasticsearch:import:model CLASS='Quote'
    ```

  5. **Add the google api and cse keys** ->  
  The cheesy_scale uses a google api key and custom search engine (CSE) key.  
  They need to be added to a file called environment_variables.yml
    - Make the file
    ```
    touch config/environments/environment_variables.yml
    ```
    - Add the keys to the file. [You can get your keys here](https://developers.google.com/custom-search/docs/tutorial/creatingcse)
    ```
    development:
         GOOGLE_API_KEY: "YourApiKeyHere"
         GOOGLE_CUSTOM_SEARCH_ENGINE_KEY: "YourCustomSearchEngineKeyHere"
    test:
         GOOGLE_API_KEY: "YourApiKeyHere"
         GOOGLE_CUSTOM_SEARCH_ENGINE_KEY: "YourCustomSearchEngineKeyHere"
    ```
    - Configure your custom search engine [to search the entire web](https://support.google.com/customsearch/answer/2631040?hl=en).   

  6. **Start server and run the first _update cheesy score_**
    ```
    rails s
    ```
    - Log in as an admin at localhost:3000/admins/sign_in  
    - Use the email and password from db/seeds.rb  
    - Use _"Update Cheesy Score"_ in the navbar at the bottom of the screen to get the initial cheesiness scores

  7. **Enjoy the deliciously cheesy quotes!**  


# Tests


  This app is tested with Rspec to run the tests use ->
  ```
  bundle exec rspec
  ```

# Documentation


  The documentation for this app is automatically generated using yard.
  To generate the documentation on your local machine use ->
  ```
  yard doc
  ```

# Services
  * The search functionality is powered by elasticsearch-rails. For more information visit [their github repository](https://github.com/elastic/elasticsearch-rails/tree/master/elasticsearch-rails)

  * The CheesyScale™ makes use of Google Custom Search to assign each quote a cheesy score. For more information visit [google's CSE portal](https://support.google.com/customsearch/answer/4513751?hl=en&ref_topic=4513742)



# Deployment instructions

  1. If you want to deploy your own version [start with this guide](https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up) provided here by heroku:
  2. During deployment the app uses bonsai as a hosted elasticsearch provider.  
  Provision your app with bonsai (using heroku command line interface) and import the models into elasticsearch
  ```
  heroku addons:create bonsai:sandbox-10
  heroku run bundle exec rake environment elasticsearch:import:model CLASS='Quote' FORCE=y
  ```
  3. Set your Google api and google CSE keys as env variables in heroku
  ```
  heroku config:set GOOGLE_API_KEY="YourApiKeyHere"
  heroku config:set GOOGLE_CUSTOM_SEARCH_ENGINE_KEY="YourCustomSearchEngineKeyHere"
  ```
