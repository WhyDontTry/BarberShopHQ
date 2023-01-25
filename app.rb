#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActineRecord::Base #создали сущность

end

get '/' do
    erb "Yo man!"			
end
