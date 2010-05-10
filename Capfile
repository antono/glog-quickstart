load 'deploy' if respond_to?(:namespace) # cap2 differentiator

set :host,        "example.com"
set :application, host
set :repository,  "git://github.com/user/blog.git"
set :scm, :git
set :ssh_options, { :forward_agent => true }
set :deploy_to,   "/home/user_name/www/#{application}"

ssh_options[:forward_agent] = true

role :web, host
role :app, host
role :db,  host

def restart_passenger
  run "cd #{release_path} && touch tmp/restart.txt"
end

namespace :deploy do
  task :migrate do
    puts "We running glog, dude... ;)"
  end

  task :start do
    restart_passenger
  end

  task :stop do
    # sudo /etc/init.d/{apache2,nginx} stop
  end

  task :restart do
    restart_passenger
  end
end
