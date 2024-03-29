set :application, "simfy"
set :repository, "git@github.com:simfyalex/simfy.git"

default_run_options[:pty] = true  # Must be set for the password prompt
                                                 # from git to work
set :scm, "git"
set :user, "simfyalex"  # The server's user for deploys
set :scm_passphrase, "simfydemo011"  # The deploy user's password
set :ssh_options, { :forward_agent => true }
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :branch, "master"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
set :use_sudo, false
set :deploy_to, "/var/www/#{application}"
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end