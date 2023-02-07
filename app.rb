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

class Contact < ActiveRecord::Base
end

before do
    @barbers = Barber.order "created_at DESC"
end

get '/' do

    erb :index			
end

get '/visit' do
    erb :visit
end

post '/visit' do
    @name       = params[:username]
    @phone      = params[:phone]
    @datestamp  = params[:datetime]
    @barber     = params[:barber]
    @color      = params[:color]

    Client.create(
        :name       => @name,
        :phone      => @phone,
        :datestamp  => @datestamp,
        :barber     => @barber,
        :color      => @color
    )

end