desc 'Generate presentation'
task :presentation do
  %w(dag_1).each do |dag|
    sh "reveal-ck generate -d presentasjon/slides/#{dag} -f presentasjon/#{dag}.md"
  end
end
