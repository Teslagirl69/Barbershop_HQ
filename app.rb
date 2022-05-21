#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


#устанавливаем и создаем БД
set :database, {adapter: "sqlite3", database: "barbershop.db"}



# создаем сущности - классы Client и Barber
class Client  < ActiveRecord::Base

end

class Barber  < ActiveRecord::Base
end

get '/' do
	erb :index
end
