require 'httparty'
class Recipe < ActiveRecord::Base
  include HTTParty

  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'food2fork.com'
  key_value = ENV['FOOD2FORK_KEY']
  base_uri "http://#{hostport}/api"
  default_params key: key_value
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end

