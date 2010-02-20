# Do not litter my hard drive with unneded revisions
after "deploy:restart", "deploy:cleanup"

set :use_sudo, false
