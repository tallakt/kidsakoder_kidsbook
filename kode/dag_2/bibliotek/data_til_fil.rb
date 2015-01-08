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


