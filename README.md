[ ![Codeship Status for Reinoptland/cheezy-quote](https://app.codeship.com/projects/b21a2b60-897b-0135-396b-4ea0e6564655/status?branch=master)](https://app.codeship.com/projects/248649)

# :cheese_wedge: Cheezy-quote :cheese_wedge:

Cheezy-quote is an app that inspires you with deliciously cheesy quotes!

# Features

### For Users
* CRUD app for quotes
* ...

### For Maintainers
* Tested with RSpec
* Continuous Integration through Codeship
  * All branches pushed to this repository are automatically tested.
  * This app deploys on heroku. The master branch is automatically tested and deploys upon passing the test suite.
* [Automatically generated documentation using YARD](doc/index.html)


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
  2. Create and seed the database ->
    ```  
    rake db:setup
    ```
* Tests
  * This app is tested with Rspec to run the tests use ->
    ```
    bundle exec rspec
    ```

* Services (job queues, cache servers, search engines, etc.)
  Coming soon

* Deployment instructions


If you want to deploy your own version use [the guide](https://devcenter.heroku.com/articles/getting-started-with-ruby#set-up) provided here by heroku:
