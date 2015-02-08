require 'sinatra'

enable :sessions

FORBRUK_VANN_PER_DAG = 5

get '/' do
  erb :index
end

get '/start' do
  spill = {}
  spill[:dag] = 1
  spill[:tilstand] = 100 # flåtens tilstand
  spill[:mat] = 70       # hvor masse mat har de, i antall dager
  spill[:vann] = 1040    # Så mye vann de har med
  spill[:drifting] = 0   # Hvis de drifter 100% ut av kurs er de ferdige
  spill[:avstand] = 0    # 698 mil til målet
  session[:spill] = spill
  p spill
  p session[:spill]

  redirect to('/seilas')
end

get '/seilas' do
  @spill = session[:spill]
  p @spill
  erb :seilas
end

# Disse angir at spillet er slutt
get '/torste' do
  erb :torste
end

get '/forsvunnet' do
  erb :forsvunnet
end

get '/synk' do
  erb :synk
end

get '/fremme' do
  @spill = session[:spill]
  erb :fremme
end

# Dette er ting som kan skje uventet

get '/storm' do
  @spill = session[:spill]
  @spill[:drifting] = @spill[:drifting] + rand(10..50)
  @spill[:tilstand] = @spill[:tilstand] + rand(-50..-10)

  if @spill[:drifting] >= 100
    redirect to('/forsvunnet')
  elsif @spill[:tilstand] <= 0
    redirect to('/synk')
  end
  erb :storm
end

# Dette er valgene man har hver dag

get '/seil_videre' do
  @spill = session[:spill]
  @spill[:dag] = @spill[:dag] + 5
  @spill[:mat] = @spill[:mat] - 5
  @spill[:vann] = @spill[:vann] - 5 * FORBRUK_VANN_PER_DAG
  @spill[:avstand] = @spill[:avstand] + rand(20..60)
  @spill[:drifting] = @spill[:drifting] + rand(-30..5)
  if @spill[:drifting] < 0
    @spill[:drifting] = 0
  end
  @spill[:tilstand] = @spill[:tilstand] - rand(0..5)

  if @spill[:vann] < 0 
    redirect to('/torste')
  elsif @spill[:drifting] >= 100
    redirect to('/forsvunnet')
  elsif @spill[:tilstand] <= 0
    redirect to('/synk')
  elsif @spill[:avstand] >= 698
    redirect to('/fremme')
  elsif rand(1..8) == 1
    redirect to('/storm')
  else
    redirect to('/seilas')
  end
end

get '/fisking' do
  @spill = session[:spill]
  @spill[:dag] = @spill[:dag] + 5
  @spill[:mat] = @spill[:mat] + rand(0..50)
  @spill[:vann] = @spill[:vann] - 5 * FORBRUK_VANN_PER_DAG
  @spill[:avstand] = @spill[:avstand] + rand(-5..5)
  @spill[:drifting] = @spill[:drifting] + rand(0..30)
  @spill[:tilstand] = @spill[:tilstand] + rand(0..5)

  if @spill[:vann] < 0 
    redirect to('/torste')
  elsif @spill[:drifting] >= 100
    redirect to('/forsvunnet')
  elsif @spill[:tilstand] <= 0
    redirect to('/synk')
  elsif @spill[:avstand] >= 698
    redirect to('/fremme')
  elsif rand(1..8) == 1
    redirect to('/storm')
  else
    redirect to('/seilas')
  end
end

get '/reparasjoner' do
  @spill = session[:spill]
  @spill[:dag] = @spill[:dag] + 5
  @spill[:mat] = @spill[:mat] - 5
  @spill[:vann] = @spill[:vann] - 5 * FORBRUK_VANN_PER_DAG
  @spill[:avstand] = @spill[:avstand] + rand(-5..5)
  @spill[:drifting] = @spill[:drifting] + rand(0..21)
  @spill[:tilstand] = @spill[:tilstand] + rand(10..50)
  if @spill[:tilstand] > 100
    @spill[:tilstand] = 100
  end

  if @spill[:vann] < 0 
    redirect to('/torste')
  elsif @spill[:drifting] >= 100
    redirect to('/forsvunnet')
  elsif @spill[:tilstand] <= 0
    redirect to('/synk')
  elsif @spill[:avstand] >= 698
    redirect to('/fremme')
  elsif rand(1..8) == 1
    redirect to('/storm')
  else
    redirect to('/seilas')
  end
end
