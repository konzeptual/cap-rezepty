# for Passenger 
namespace :deploy do
  task :start do
    # nothing
  end
  task :stop do
    # nothing
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
