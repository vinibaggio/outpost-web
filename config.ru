require 'rubygems'
require 'bundler'

Bundler.setup(:default)

require 'outpost_web_app'

run Sinatra::Application
