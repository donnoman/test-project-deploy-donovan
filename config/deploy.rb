require 'cap-recipes/tasks/provison'
require 'cap-recipes/tasks/teelogger'
require 'cap-recipes/tasks/god'
require 'cap-recipes/tasks/ruby19'
require 'cap-recipes/tasks/git'
require 'cap-recipes/tasks/nginx_unicorn'
require 'cap-recipes/tasks/bundler'
require 'cap-recipes/tasks/unicorn'

set :application, "test-project-deploy-donovan"
set :repository,  "git@github.com:donovanbray/test-project-deploy-donovan.git"
set :scm, "git"


set :deploy_to, "/var/www"
set :god_watcher, :upstart
set :nginx_unicorn_watcher, :god
set :unicorn_watcher, :god
set :ruby_ver, 'ruby-1.9.3-p385'
set :bundler_opts, %w(--deployment --no-color)
set :bundler_rubygems_minimum_ver, "2.2.1"
set :bundler_ver, "1.5.2"

after "deploy:restart", "deploy:cleanup"

server "10.0.2.15", :web, :app, :db, :primary => true
