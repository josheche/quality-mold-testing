SSHKit.config.command_map[:rake] = "bundle exec rake"

# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'mold'
set :repo_url, 'git@github.com:entropy-software/quality-mold-testing.git'

set :branch, 'master'

set :deploy_to, '/home/apps/mold'

set :scm, :git

set :stages, ["production"]

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

set :unicorn_config_path, "config/unicorn.rb"

set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_files, %w{config/deploy/nginx.conf.erb}

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')
set :linked_dirs, %w{log tmp/pids public}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.2.2'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

# nginx
set :nginx_service_path, "/etc/init.d/nginx"
set :nginx_roles, :web
set :nginx_root_path, "/etc/nginx"
set :nginx_sites_available, "sites-available"
set :nginx_sites_enabled, "sites-enabled"
set :nginx_template, "#{stage_config_path}/nginx.conf.erb"
set :app_server, true
set :app_server_socket, "/tmp/unicorn-#{fetch :application}.socket"

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
