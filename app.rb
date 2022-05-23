#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pry'


#устанавливаем и создаем БД
set :database, {adapter: "sqlite3", database: "barbershop.db"}


# создаем сущности - классы Client и Barber
class Client  < ActiveRecord::Base

validates :name, presence: true
validates :phone, presence: true
validates :datestamp, presence: true
validates :barber, presence: true
validates :color, presence: true

end


class Barber  < ActiveRecord::Base
end


before do
	@barbers = Barber.all
end

get '/' do
	@barbers = Barber.all
	erb :index
end


get '/visit' do

 @user = Client.new
	erb :visit
end

colors = { "#7bd148" => 'Зеленый', "#5484ed" => 'Темно-Голубой', "#a4bdfc" => 'Голубой', "#46d6db" => 'Бирюзовый',
"#7ae7bf" => 'Светло-Зеленый', "#51b749" => 'Темно-Зеленый', "#fbd75b" => 'Желтый', "#ffb878" => 'Оранжевый', "#ff887c" => 'Красный',
"#dc2127" => 'Темно-Красный', "#dbadff" => 'Пурпурный', "#e1e1e1" => 'Серый'}


post '/visit' do


	@user = Client.new params[:client]

 	if @user.save
	erb "<h2> Спасибо, запись прошла успешно </h2>"

	else
	erb "<h2> Произошла ошибка. Пожалуйста, убедитесь, что все поля заполнены </h2>"

	end
end
