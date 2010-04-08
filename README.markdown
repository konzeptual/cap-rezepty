Private capistrano recepies for comfortable deployment.

### Usage
      cd your_rails_app
      capify .
      mkdir -p ./config/deploy/recipies/cap_rezepty
      git submodule add git@github.com:krick/cap-rezepty.git config/deploy/recipies/cap-rezepty
in ./config/deploy.rb

    load File.join(File.dirname(__FILE__), 'deploy/recipies/cap-rezepty/cap_rezepty.rb') if respond_to?(:namespace)
      
 