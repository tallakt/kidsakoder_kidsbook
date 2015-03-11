require 'sinatra'

enable :sessions
set :session_secret, 'KIDSKILL99'

set :bind, "0.0.0.0" # slik at vi åpner for tilgang fra andre maskiner

SPILL = {:spillere => {}, :highscore => {}}

BRETT =
	"###........................" +
	"##........................." +
	"..........................." +
	"..........................." +
	"...#####.###.........#....." +
	".....#######........##....." +
	".....#####.........##......" +
	"......##..........###......" +
	"..................###......" +
	"..................####....." +
	"..................#........" +
	"###........................" +
	"####......................." +
	"###........................" +
	"##............##....#......" +
	"............####....###...." +
	"............####....###...." +
	"..###.........##....####..." +
	"..####........###...####..." +
	"....................###...." +
	"....###...................." +
	"....###...................." +
	"..........................." +
	"..........###.............." +
	"..........###.............." +
	".......#####..............." +
	"#########################.."

def initier_brett_tabell(brett)
	resultat = {}
	teller = 0
	27.times do |y|
		27.times do |x|
			resultat[[x, y]] = brett[teller]
			teller = teller + 1
		end
	end
	resultat
end

BRETT_TABELL = initier_brett_tabell(BRETT)


def lag_brett(spiller)
	andre = []
	if spiller
		andre = spillere_i_naerheten(spiller[:navn], SPILL[:spillere])
	end
	brett = ""
	27.times do |y|
		27.times do |x|
			tegn = " #{BRETT_TABELL[[x, y]]}"

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

def flytt_spiller(spiller_navn, dx, dy)
	spiller = SPILL[:spillere][spiller_navn]
	if spiller
		ny_x = spiller[:x] + dx
		ny_y = spiller[:y] + dy
		if ny_x < 0
			ny_x = 0
		end
		if ny_y < 0
			ny_y = 0
		end
		if ny_x >= 27
			ny_x = 26
		end
		if ny_y >= 27
			ny_y = 26
		end
		if BRETT_TABELL[[ny_x, ny_y]] == '.'
			spiller[:x] = ny_x
			spiller[:y] = ny_y
		end
	end
end


get '/' do
	navn = session[:navn]
	@innlogget = navn && SPILL[:spillere][navn]
	erb :index
end

def randpos()
	return rand 0..25
end

post '/behandle-start' do
	navn = params[:navn][0..23]
	session[:navn] = navn
	SPILL[:spillere][navn] = {
		:navn => navn,
		:liv => 40,
		:x => randpos(),
		:y => randpos(),
		:kills => 0,
	}
	redirect to("/")
end

get '/live' do
	@spillere = SPILL[:spillere]
	navn = session[:navn]
	meg = @spillere[navn]
	@brett = lag_brett(meg)

	@all_scores = SPILL[:highscore].to_a.
		sort do |a,b|
			-(a.last <=> b.last)
		end
	@highscores = @all_scores[0..2]
	p @highscores
	p SPILL[:highscore]
	erb :live, layout: false
end

get '/opp' do
	flytt_spiller(session[:navn], 0, -1)
end

get '/ned' do
	flytt_spiller(session[:navn], 0, 1)
end

get '/venstre' do
	flytt_spiller(session[:navn], -1, 0)
end

get '/hoyre' do
	flytt_spiller(session[:navn], 1, 0)
end

get '/skyt' do
	spillere = SPILL[:spillere]
	navn = session[:navn]
	meg = spillere[navn]

	andre = spillere_i_naerheten(navn, SPILL[:spillere])
	andre.each do |spiller|
		# Gi tilfeldig skade
		skade = 2
		if skade > 0
			spiller[:liv] = spiller[:liv] - skade
		end
		# slett spillere som er døde
		if spiller[:liv] <= 0
			SPILL[:spillere].delete(spiller[:navn])
			meg[:kills] = meg[:kills] + 1
			highscores = SPILL[:highscore]
			highscores[navn] = [highscores[navn] || 0, meg[:kills]].max
		end
	end
end
