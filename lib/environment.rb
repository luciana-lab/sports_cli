# frozen_string_literal: true
# require_relative "./sports_cli/version"
require 'dotenv/load'
require 'opencage/geocoder'
require "bundler"
Bundler.require

require_all "./lib/sports_cli"

# puts ENV["GEO_KEY"]