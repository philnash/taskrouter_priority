require "bundler"
Bundler.require

set :env, ENV['RACK_ENV'] || "development"
disable :run

Envyable.load("./config/env.yml", settings.env)

require "./app.rb"
run Sinatra::Application
