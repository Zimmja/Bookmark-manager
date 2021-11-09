# frozen_string_literal: true

require './lib/bookmark'
require 'pg'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567
# rackup -p 4567

# This is a default class for testing purposes
class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @conn = PG::Connection.open(:dbname => 'bookmark_manager')
    $table_values = @conn.exec("SELECT * FROM bookmarks").to_a
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = [
      Bookmark.new('Makers', $table_values[0]["url"]),
      Bookmark.new('Reddit', 'https://www.reddit.com/'),
      Bookmark.new('Codewars', 'https://www.codewars.com/'),
      Bookmark.new('Github', 'https://github.com/')
    ]
    erb(:'bookmarks/index')
  end

  run! if app_file == $PROGRAM_NAME
end
