require_relative 'data_til_fil'

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

