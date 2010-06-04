# For testing purposes
task :uname do
  run "uname -a"
end

namespace :log do
  
  desc "downloads most recent lines from log file from remote server and shows it's tail"
  task :show do
    target_file = "/tmp/#{rails_env}.log"
    remote_log_file = "#{current_path}/log/#{rails_env}.log"
    remote_tmp_file = "/tmp/#{rails_env}.log"
    run "tail -n 1000 #{remote_log_file} > #{remote_tmp_file}"
    download remote_tmp_file, target_file, :via => :scp
    exec "tail -n 100 #{target_file}"
    # the following lines does not work.... hm
    exec "echo ============== file was copied to =============="
    exec "echo 'file = #{target_file}'"
    exec "echo =============="
  end
  task :get do
    target_file = "/tmp/#{rails_env}.log"
    remote_log_file = "#{current_path}/log/#{rails_env}.log"
    download remote_log_file, target_file, :via => :scp
  end
end

namespace :rake do

  desc "Executes rake given rake task. Usage: cap rake:do TASK=test"
  task :do do 
    rake_task = ENV['TASK']
    unless rake_task.nil?
      run "cd #{current_path} && rake #{rake_task} RAILS_ENV=#{rails_env}"
    else
      exec 'cap -e rake:do'
    end
  end
end

desc 'print some env info on the remote server'
namespace :env do
  task :echo do
    run "echo printing out cap info on remote server"
    run "echo $PATH"
    run "printenv"
  end
end
