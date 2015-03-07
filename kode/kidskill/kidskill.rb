require 'sinatra'

enable :sessions
set :session_secret, 'KIDSKILL99'

set :bind, "0.0.0.0" # slik at vi åpner for tilgang fra andre maskiner

SPILL = {:spillere => {}}

def lag_brett(spiller)
  andre = []
  if spiller
    andre = spillere_i_naerheten(spiller[:navn], SPILL[:spillere])
  end
  brett = ""
  25.times do |y|
    25.times do |x|
      tegn = " ."

      # Tegn andre spillere i nærheten
      andre.each do |annen|
        if annen[:x] == x && annen[:y] == y then
          tegn=" %"
        end
      end

      if spiller
        # Tegn denne spilleren
        if spiller[:x] == x && spiller[:y] == y
          tegn = " @"
        end
      else
        # Spectator mode, tegn alle spillere
        SPILL[:spillere].each do |_, annen|
          if annen[:x] == x && annen[:y] == y
            tegn = " O"
          end
        end
      end
      brett = brett + tegn
    end
    brett = brett + "\n"
  end
  brett
end


def spillere_i_naerheten(navn, spillere)
  resultat = []
  meg = spillere[navn]
  if meg
    mx = meg[:x]
    my = meg[:y]

    spillere.each do |spiller_navn, spiller_data|
      if navn != spiller_navn
        dx = (spiller_data[:x] - mx).abs
        dy = (spiller_data[:y] - my).abs
        if dy < 4 && dx < 4
          resultat.push spiller_data
        end
      end
    end
  end
  resultat
end


get '/' do
  navn = session[:navn]
  @innlogget = navn && SPILL[:spillere][navn]
  erb :index
end

post '/behandle-start' do
  navn = params[:navn]
  session[:navn] = navn
  SPILL[:spillere][navn] = {:navn => navn, :liv => 20, :x => 12, :y => 12 }
  redirect to("/")
end

get '/live' do
  @spillere = SPILL[:spillere]
  navn = session[:navn]
  meg = @spillere[navn]
  @brett = lag_brett(meg)
  @debug = SPILL.inspect
  erb :live, layout: false
end

get '/opp' do
  navn = session[:navn]
  spiller = SPILL[:spillere][navn]
  if spiller
    spiller[:y] = spiller[:y] - 1
    if spiller[:y] < 0
      spiller[:y] = 0
    end
  end
end

get '/ned' do
  navn = session[:navn]
  spiller = SPILL[:spillere][navn]
  if spiller
    spiller[:y] = spiller[:y] + 1
    if spiller[:y] >= 25
      spiller[:y] = 24
    end
  end
end

get '/venstre' do
  navn = session[:navn]
  spiller = SPILL[:spillere][navn]
  if spiller
    spiller[:x] = spiller[:x] - 1
    if spiller[:x] < 0
      spiller[:x] = 0
    end
  end
end

get '/hoyre' do
  navn = session[:navn]
  spiller = SPILL[:spillere][navn]
  if spiller
    spiller[:x] = spiller[:x] + 1
    if spiller[:x] >= 25
      spiller[:x] = 24
    end
  end
end

get '/hoyre' do
  navn = session[:navn]
  spiller = SPILL[:spillere][navn]
  if spiller
    spiller[:x] = spiller[:x] + 1
    if spiller[:x] >= 25
      spiller[:x] = 24
    end
  end
end

get '/skyt' do
  andre = spillere_i_naerheten(session[:navn], SPILL[:spillere])
  andre.each do |spiller|
    # Gi tilfeldig skade
    skade = rand -10..5
    if skade > 0
      spiller[:liv] = spiller[:liv] - skade
    end
    # slett spillere som er døde
    if spiller[:liv] <= 0
      SPILL[:spillere].delete(spiller[:navn])
    end
  end
end
