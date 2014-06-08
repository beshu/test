require 'sinatra'
require 'slim'
require 'sass'

get '/stylesheet.css' do
  sass :stylesheet 
end


get '/' do 
  slim :index
end


