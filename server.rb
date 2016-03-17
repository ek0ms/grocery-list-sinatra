require 'sinatra'
require 'csv'
require 'pry'

get '/groceries' do
  @groceries = []
  CSV.foreach('grocery_list.csv', :headers => true, :header_converters =>
    :symbol) do |row|
      @groceries << row
  end
  @grocery_list = @groceries.map { |row| row.to_hash }
  erb :index
end

get '/' do
  redirect '/groceries'
end

post '/groceries' do
  grocery = params['grocery']
  quantity = params['quantity']
  data = [grocery, quantity]
  unless grocery.strip.empty?
    CSV.open("grocery_list.csv", "a") do |file|
      file.puts(data)
    end
  end

  redirect "/groceries"
end

get '/groceries/:grocery' do
  @groceries = []
  CSV.foreach('grocery_list.csv', :headers => true, :header_converters =>
    :symbol) do |row|
      @groceries << row
  end
  @grocery_list = @groceries.map { |row| row.to_hash }
  @grocery = params['grocery']
  @quantity = ""
  @grocery_list.each do |grocery|
    if grocery[:name] == @grocery
      @quantity = grocery[:quantity]
    end
  end
  erb :grocery
end
