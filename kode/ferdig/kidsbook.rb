require 'sinatra'

get '/' do
  erb :index
end

post '/nytt-innlegg' do
  innlegg = Dir.glob "innlegg/*"
  puts "===="
  puts innlegg
  puts params.inspect
  puts "===="
  redirect to("/")
end
