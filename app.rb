require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  enable :sessions, :method_override

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks/create' do
    Bookmark.create(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
