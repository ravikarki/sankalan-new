# Be sure to restart your server when you modify this file.

require 'rubygems'
require 'bundler/setup'
require 'sinatra'
# require "sinatra/content_for"
require 'sinatra/static_assets'
require './sankalan'

set :environment, ENV['RACK_ENV']
set :run, false
set :raise_errors, true

run Sinatra::Application

# use Rack::Auth::Basic, "Restricted Area" do |username, password|
#   [username, password] == ['vshop', 'v-shoppe']
# end
