require 'sinatra'
require 'slim'
require 'sass'
require 'ostruct'

Slim::Engine.set_default_options :pretty => true

class Blog < Sinatra::Base
  set :root, File.expand_path('../../', __FILE__)
  set :articles, []

  Dir.glob "#{root}/articles/*.article.txt" do |file|

    title, content = File.read(file).split("========")
    article = OpenStruct.new 
    article.title = title
    article.content = content
    article.url = File.basename(file, '.article.txt')

    get "/#{article.url}" do
      slim :post, :locals => { :article => article }
    end

    articles << article 
  end  


  get '/' do 
    slim :index
  end

  get '/stylesheet.css' do
    sass :stylesheet 
  end
end

