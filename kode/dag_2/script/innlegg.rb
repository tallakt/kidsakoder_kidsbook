require 'yaml'

INNLEGG_FIL = "innlegg.yaml"

def hent_innlegg_fra_fil
  if File.exist? INNLEGG_FIL
    innlegg_som_tekst = File.read(INNLEGG_FIL)
    YAML::load(innlegg_som_tekst)
  else
    []
  end
end

def skriv_innlegg_til_fil(innlegg)
  File.open(INNLEGG_FIL, 'w') do |fil|
    fil.write(innlegg.to_yaml)
  end
end


puts "Hva heter du?"
navn = gets.strip
puts "Skriv inn det nye innlegget og trykk linjeskift"
tekst_til_innlegg = gets.strip

innlegg = hent_innlegg_fra_fil
nytt_innlegg = {:avsender => navn, :tekst => tekst_til_innlegg}
innlegg.push(nytt_innlegg)

innlegg.each do |i|
  puts ""
  puts "Avsender: #{i[:avsender]}"
  puts "Innlegg: #{i[:tekst]}"
end

skriv_innlegg_til_fil(innlegg)

