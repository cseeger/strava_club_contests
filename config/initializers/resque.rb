require 'resque_scheduler'

Resque.redis = Redis.new(:host => 'localhost', :port => 6379, :thread_safe => true)
Resque.schedule = YAML.load_file(File.join(Rails.root, 'config/resque_schedule.yml'))
