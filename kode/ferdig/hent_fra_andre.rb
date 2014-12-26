require 'open-uri'
require 'yaml'

def hent_fra_andre(liste_over_adresser)
  resultater = []
  liste_over_adresser.each do |adresse|
    hentet_tekst = open("http://#{adresse}:4567/siste.yaml").read
    hentet_data = YAML.load(hentet_tekst)
    nyeste_innlegg = hentet_data[0]

    resultat_for_adresse = {
      :adresse => adresse,
      :avsender => nyeste_innlegg[:avsender],
      :tekst => nyeste_innlegg[:tekst]
    }

    resultater.push resultat_for_adresse
  end

  resultater
end
