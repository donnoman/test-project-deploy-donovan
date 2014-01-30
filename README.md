This is a test deployment project.


Phase 1 Pre-Reqs

  install homebrew http://brew.sh/

  install rvm https://rvm.io/rvm/install

  install virtualbox  https://www.virtualbox.org/wiki/Downloads

  install vagrant http://www.vagrantup.com/

  http://stackoverflow.com/questions/20983515/problems-installing-nokogiri-gem-on-mac-osx-snow-leopard-with-ruby-2-0-0-p353

  rvm install ruby-2.0.0-p353 --disable-binary

  # Requires Update to xcode >= 4.6.2 http://connect.apple.com

  to download xcode you need a free developer account

  xcode 5.0.2 from the mac app store it's free
  https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12

  xcode 5.0.2 requires OSX 10.8.4 or higher

  I installed xcode 4.6.3 which requires Mountain Lion or Lion

  https://developer.apple.com/downloads/index.action#

  Search for "xcode"

  I also grabbed the update osx lion april 2013 command line tools since I'm on 10.7

Phase 2 the project

  mkdir test-project-deploy-donovan

  cd test-project-deploy-donovan

  git init

  # https://rvm.io/workflow/projects

  rvm --ruby-version use ruby-2.0.0-p353@test-project-deploy-donovan

  vagrant init test-project-deploy-donovan-precise64 http://files.vagrantup.com/precise64.box

  vagrant up


Phase 3 the app

  gem install rails -v 4.0.2

  rails new .

  rails generate controller welcome index

  make welcome#index the root route

  make your changes to views/welcome/index.html.erb

Phase 4 capistrano

  add "gem 'cap-recipes', :git => "git@github.com:demandchain/cap-recipes.git", :branch => 'master', :require => false" to the "group :development, :test do" block.

  capify

  unrem load 'deploy/assets' from Capfile

  modify the config/deploy.rb

  # use the new bundler gem development override (this can replace our custom gem_dev helper)
  bundle config --local local.cap-recipes vendor/checkouts/cap-recipes

Phase 5 provisioning

Phase 6 setup

phase 7 deploy:cold

phase 8 deploy




