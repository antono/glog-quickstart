require "rubygems"
require "bundler"
Bundler.setup

require 'glog'
require 'sass/plugin/rack'

use Rack::Static, :urls => ['/stylesheets', '/javascripts', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger
use Sass::Plugin::Rack

if ENV['RACK_ENV'] == 'development'
  use Rack::Reloader
  use Rack::ShowExceptions
  Sass::Plugin.options.merge(:never_update => false, :full_exception => true, :style => :expanded)
end

# plugins
require 'plugins/robots_txt'
use Rack::RobotsTxt

run Glog::Server.new
