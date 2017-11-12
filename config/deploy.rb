# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, 'tech_expert_final'
set :repo_url,  'git@github.com:yasuyuki-s/tech_expert_final.git'
set :branch,  'master'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'
set :bundle_flags, '--production --quiet'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/yasu/.ssh/ec2_user.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
