desc 'Generer presentasjon som filer'
task :presentasjon_filer do
  sh "reveal-ck generate -d genererte-slides/ -f presentasjon.md"
end

desc 'Start web server med presentasjonen som er oppdatert'
task :presentasjon_server do
  sh "reveal-ck server -d genererte-slides/ -f presentasjon.md"
end
