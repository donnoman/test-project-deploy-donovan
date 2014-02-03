This is a test deployment project.


Phase 1 Pre-Reqs

  install homebrew http://brew.sh/

  install rvm https://rvm.io/rvm/install

  install virtualbox  https://www.virtualbox.org/wiki/Downloads

  install vagrant http://www.vagrantup.com/

  install the host-shell provisioner. This allows us to send some commands to the host during a provision. https://github.com/phinze/vagrant-host-shell

  $ vagrant plugin install vagrant-host-shell

  http://stackoverflow.com/questions/20983515/problems-installing-nokogiri-gem-on-mac-osx-snow-leopard-with-ruby-2-0-0-p353

  $rvm install ruby-2.0.0-p353 --disable-binary

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

  add "gem 'cap-recipes', :git => "git@github.com:donnoman/cap-recipes.git", :branch => 'master', :require => false" to the "group :development, :test do" block.

  capify

  unrem load 'deploy/assets' from Capfile

  modify the config/deploy.rb

  # if you want to develop cap-recipes at the same time:

  git clone git@github.com:donnoman/cap-recipes.git vendor/checkouts/cap-recipes

  # use the new bundler gem development override (this can replace our custom gem_dev helper)

  bundle config --local local.cap-recipes vendor/checkouts/cap-recipes

Phase 5 provisioning

  steps 5 - 7 are automated with the vagrant-host-shell command: cap deploy:provision deploy:setup deploy:cold

  cap deploy:provision

Phase 6 setup

  cap deploy:setup

phase 7 deploy:cold

  cap deploy:cold

phase 8 deploy

  cap deploy

  OR

  cap deploy:migrations #(when you actually have a db to migrate)







