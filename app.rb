#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: "sqlite3", database: "barbershop.db"}

class Client < ActiveRecord::Base #создали сущность
end

class Barber < ActiveRecord::Base
end

get '/' do
    erb "Yo man!"			
end
