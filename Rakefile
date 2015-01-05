desc 'Generer presentasjon som filer'
task :presentation do
  %w(dag_1).each do |dag|
    sh "reveal-ck generate -d presentasjon/slides/#{dag} -f presentasjon/#{dag}.md"
  end
end

desc 'Start web server med presentasjonen som er oppdatert'
task :presentasjon_server do
  %w(dag_1).each do |dag|
    sh "reveal-ck server -d presentasjon/slides/#{dag} -f presentasjon/#{dag}.md"
  end
end
