require 'sinatra'
require 'nokogiri'
require 'erb'

get '/' do
  @items = rss.xpath('//item').collect do |item| 
    episode = {}
    episode[:title] = item.at_xpath('title').to_str
    episode[:libsyn_id] = item.at_xpath('libsyn:ItemId').to_str
    episode
  end

  erb :index
end

get '/episode/:libsyn_id' do |id|
  item = rss.at_xpath("//libsyn:ItemId[text()='#{id}']/..")
  
  @title = item.at_xpath('title').to_str
  @url = item.at_xpath('media:content').attributes['url'].value
  @description = item.at_xpath('description').to_str
  
  erb :episode
end

def rss
  data = open('public/feed.rss').read()
  Nokogiri::XML(data)  
end

