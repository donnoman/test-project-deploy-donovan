require 'cap_recipes/tasks/provision'
require 'cap_recipes/tasks/teelogger'
require 'cap_recipes/tasks/git'
require 'cap_recipes/tasks/nodejs' # Satisfies -- Could not find a JavaScript runtime. See https://github.com/sstephenson/execjs for a list of available runtimes.
require 'cap_recipes/tasks/ruby19'
require 'cap_recipes/tasks/god'
require 'cap_recipes/tasks/bundler'
require 'cap_recipes/tasks/nginx_unicorn'
require 'cap_recipes/tasks/unicorn'

ssh_options[:forward_agent] = true

set :application, "test-project-deploy-donovan"
set :repository,  "git@github.com:donovanbray/test-project-deploy-donovan.git"
set :scm, "git"
set :user, "vagrant"
set :deploy_via, :remote_cache

set :deploy_root, '/var/www'
set(:deploy_to) {"#{deploy_root}/#{application}"}
set :god_watcher, :upstart
set :nginx_unicorn_watcher, :god
set :unicorn_watcher, :god
set :ruby_ver, 'ruby-1.9.3-p385'
set :bundler_opts, %w(--deployment --no-color)
set :bundler_rubygems_minimum_ver, "2.2.1"
set :bundler_ver, "1.5.2"
set :god_open_socket, true
set :nginx_unicorn_server_name, "_"

after "deploy:setup" do
  sudo "chown #{user}:#{user} #{deploy_root}"
  sudo "chown -R #{user}:#{user} #{deploy_to}"
end

before "bundler:configure" do
  utilities.apt_install "nodejs" #http://stackoverflow.com/questions/9202324/execjs-could-not-find-a-javascript-runtime-but-execjs-and-therubyracer-are-in
end

after "deploy:restart", "deploy:cleanup"

server "192.168.33.10", :web, :app, :db, :primary => true
