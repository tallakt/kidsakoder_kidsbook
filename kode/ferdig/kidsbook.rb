require 'sinatra'
require 'yaml/store'

LAGRING = YAML::Store.new "innlegg.yaml"

enable :sessions
set :session_secret, '--__KIDSAKODER__--'

set :bind, "0.0.0.0" # slik at vi åpner for tilgang fra andre maskiner

def les_alle_innlegg
  LAGRING.transaction do
    LAGRING.fetch("innlegg", [])
  end
end

def skriv_alle_innlegg(innlegg)
  LAGRING.transaction do
    LAGRING["innlegg"] = innlegg
  end
end


get '/' do
  @innlegg = les_alle_innlegg
  @avsender = session[:avsender]
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
  gamle_innlegg = les_alle_innlegg

  nytt_innlegg = {
    :tekst => params[:innlegg],
    :avsender => session[:avsender]
  }

  alle_nye_innlegg = [nytt_innlegg] + gamle_innlegg
  skriv_alle_innlegg(alle_nye_innlegg)

  redirect to("/")
end
