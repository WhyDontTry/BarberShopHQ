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
    
    c = Client.new params[:client]
    c.save

    erb "<h2>Спасибо вы записались!</h2>"
end

get '/contacts' do
    erb :contacts
end

post '/contacts' do
    @email = params[:email]
    @message = params[:message]

    Contact.create(
        :email   => @email,
        :message => @message
    )

    erb "<h2>Success!</h2>"
end