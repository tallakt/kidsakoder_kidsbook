require 'sinatra'

require_relative 'data_til_fil'

enable :sessions
set :session_secret, '--__KIDSAKODER__--'

set :bind, "0.0.0.0" # slik at vi åpner for tilgang fra andre maskiner

get '/' do
  @avsender = session[:avsender]
  @innlegg = hent_innlegg_fra_fil
  @andres_innlegg = hent_fra_andre(["localhost"])
  erb :index
end

get '/login' do
  erb :login
end

post '/behandle-login' do
  session[:avsender] = params[:avsender]
  redirect to("/")
end


get '/logut' do
  session[:avsender] = nil
  redirect to('/')
end

get '/ny' do
  erb :ny
end

post '/behandle-ny' do
  gamle_data = hent_innlegg_fra_fil

  innlegg = {
    :tekst => params[:innlegg],
    :avsender => session[:avsender]
  }

  nye_data = [innlegg] + gamle_data
  trimmede_innlegg = nye_data[0..10] # behold ti innlegg

  skriv_innlegg_til_fil(trimmede_innlegg)

  redirect to("/")
end
