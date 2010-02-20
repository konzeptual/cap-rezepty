# ;lj
if (respond_to?(:namespace)) 
  load File.join(File.dirname(__FILE__), 'utils.rb') 
  load File.join(File.dirname(__FILE__), 'web_server.rb') 
  load File.join(File.dirname(__FILE__), 'db.rb') 
  load File.join(File.dirname(__FILE__), 'settings.rb') 
  load File.join(File.dirname(__FILE__), 'shared_dirs.rb') 
end
