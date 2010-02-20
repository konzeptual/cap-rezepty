namespace :deploy do
  desc 'Silently create shared dirs. Uses :shared_dirs variable' 
  task :mkdir_shared_dirs_if_needed do
    fetch(:shared_dirs, '').each do |dir|
      run "mkdir -p #{shared_path}/#{dir}"
    end
  end

  desc "Create symlinks of shared directories from shared to public dirs"
  task :symlink_shared_dirs do
    fetch(:shared_dirs, '').each do |dir|
      run "ln -s #{shared_path}/#{dir} #{latest_release}/#{dir}"
    end
  end

  desc "Upload shared directories to remote server"
  task :upload_shared_dirs do
    fetch(:shared_dirs, '').each do |dir|
      puts "dir = #{dir}"
      roles[:app].servers.each do |server|
        exec "rsync -avz #{dir}/ #{user}@#{server.host}:#{shared_path}/#{dir}"
      end
    end
  end

  desc "Download shared directories from remote server"
  task :download_shared_dirs do
    fetch(:shared_dirs, '').each do |dir|
      puts "dir = #{dir}"
      roles[:app].servers.each do |server|
        exec "rsync -avz #{user}@#{server.host}:#{shared_path}/#{dir} #{dir}"
      end
    end
  end

end
