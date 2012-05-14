# http://unicorn.bogomips.org/examples/unicorn.conf.rb

working_directory "/home/ubuntu/apps/strava_club_contests"
pid "/home/ubuntu/apps/strava_club_contests/tmp/pids/unicorn.pid"
stderr_path "/home/ubuntu/apps/strava_club_contests/log/unicorn.log"
stdout_path "/home/ubuntu/apps/strava_club_contests/log/unicorn.log"

listen "/tmp/unicorn.strava_club_contests.sock"
worker_processes 2
timeout 60
preload_app true

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  # the following is *required* for Rails + "preload_app true",
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
