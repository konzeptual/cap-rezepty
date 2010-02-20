
namespace :db do
  desc "Upload local db to remote server. Sqlite only"
  task :upload_to_remote do
    backup_remote_db
    development_database_path = database_config('development')
    production_database_path = database_config('staging')
    upload development_database_path, production_database_path, :via => :scp
  end

  desc 'Copy remote production  db to remote backup db. sqlite only'
  task :backup_remote_db do
    backup_database_path = database_config('staging_backup')
    production_database_path = database_config('staging')
    run "cp #{production_database_path} #{backup_database_path}"
  end
end


# http://gist.github.com/111597
#
# Reads the database credentials from the local config/database.yml file
# +db+ the name of the environment to get the credentials for
# Returns username, password, database
#
def database_config(db)
  database = YAML::load_file('config/database.yml')
  # return database["#{db}"]['username'], database["#{db}"]['password'], database["#{db}"]['database']
  return database["#{db}"].nil? ? nil : database["#{db}"]['database']
end
