#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'


#устанавливаем и создаем БД
set :database, {adapter: "sqlite3", database: "fbarbershop.db"}



# создаем сущность
class Client  < Sinatra::Base
	 register Sinatra::ActiveRecordExtension
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"
end
