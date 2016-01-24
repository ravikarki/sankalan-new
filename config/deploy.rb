#========================
#CONFIG
# #========================
# set :application, "sanklan"
# set :scm, :git
# set :git_enable_submodules, 1
# set :repository, "git@github.com:ravikarki/sankalan-new.git"
# set :branch, "integrate-sinatra"
# set :ssh_options, { :forward_agent => true }
# set :stage, :production
# set :user, "ubuntu"
# set :use_sudo, false
# set :runner, "ubuntu"
# set :deploy_to, "/home/ubuntu/sanklan"
# set :app_server, :passenger
# set :domain, "52.91.141.87"
# #========================
# #ROLES
# #========================
# role :app, "52.91.141.87"
# role :web, "52.91.141.87"
# #========================
# #CUSTOM
# #========================
# namespace :deploy do
#   task :start, :roles => :app do
#     run "touch #{current_release}/tmp/restart.txt"
#   end
#   task :stop, :roles => :app do
#     # Do nothing.
#   end
#   desc "Restart Application"
#   task :restart, :roles => :app do
#     run "touch #{current_release}/tmp/restart.txt"
#   end
# end













# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'sankalan'
set :repo_url, 'git@github.com:ravikarki/sankalan-new.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/ubuntu/sankalan'

set :passenger_in_gemfile, true
set :app_server, :passenger
set :ssh_options, { :forward_agent => true }

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  # task :start, :roles => :app do
  #   run "touch #{current_release}/tmp/restart.txt"
  # end
  # task :stop, :roles => :app do
  #   # Do nothing.
  # end
  # desc "Restart Application"
  # task :restart, :roles => :app do
  #   run "touch #{current_release}/tmp/restart.txt"
  # end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
