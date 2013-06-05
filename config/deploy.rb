#For executing corn Jobs in server.
#set :whenever_command, "bundle exec whenever"
#require "whenever/capistrano"
#require "delayed/recipes"


default_run_options[:pty] = true

set :ssh_options, {:forward_agent => true}
set :rails_env, "production"
set :main_server, 'e-solutionpark.com'
role :web, main_server
role :app, main_server
role :db, main_server, :primary => true
role :db, main_server
set :password, '0e886c4c'
set :repository, "git@github.com:solutionsfoundry/woflo.git"
set :branch, 'master'
set :user_sudo, false
set :user, "root"
set :application_name, 'app.woflo.com'
set :application, 'app.woflo.com'
set :application_directory, "/root/public_html/#{application_name}"
set :deploy_to, "#{application_directory}"


set :base_dir, "/root"

namespace :config do
  desc "copy database.yml file to latest release"
  task :db, :roles => [:app] do
    run "#{try_sudo} ln -s #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
    run "#{try_sudo} ln -s #{shared_path}/config/mongoid.yml #{latest_release}/config/mongoid.yml"
  end
end

namespace :deploy do
  task :restart, :roles => :app, :except => {:no_release => true} do
    run " touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end

# Deployment tasks
namespace :deploy do
  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do
      ;
    end
  end

  task :restart, :roles => :app, :except => {:no_release => true} do
    run " touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end


  desc "Symlink shared configs and folders on each release."
  task :symlink_shared do
    #run "ln -nfs #{shared_path}/log/production.log #{current_path}/log/production.log"
  end

end

namespace :assets do
  task :precompile, :roles => :app, :except => {:no_release => true} do
    run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env}  assets:clean}
    run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env}  assets:precompile}
  end
end

namespace :bundler do
  desc "Install bundles into application"
  task :install, :roles => [:app] do
    run "cd #{current_path} &&  bundle install  --deployment --path #{shared_path}/vendor/bundler"
  end
end

namespace :data do
  desc "Clean Old Data"
  task :clean_all, :roles => [:app] do
    run "cd #{current_path} && #{rake} RAILS_ENV=#{rails_env} clean_old_feed:all"
  end


end


after :deploy, 'bundler:install', "deploy:migrate", "assets:precompile", "deploy:restart"

after("deploy:setup") do
  run "sudo mkdir -p #{shared_path}/pids"
  run "sudo mkdir -p #{shared_path}/log"
end