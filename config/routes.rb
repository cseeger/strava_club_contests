require 'resque/server'

ClubContests::Application.routes.draw do
  root :to => 'club_contest#index'
  mount Resque::Server.new, :at => "/resque"
end
