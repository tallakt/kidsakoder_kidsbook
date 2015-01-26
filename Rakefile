desc 'Generer presentasjon som filer'
task :slides do
  sh "reveal-ck generate -d slides/ -f presentasjon.slim"
end

desc 'Start web server med presentasjonen som er oppdatert'
task :server do
  sh "reveal-ck server -d slides/ -f presentasjon.slim"
end


desc "Update github pages"
task :gh do
  if `git status --porcelain`.empty?
    Rake::Task["slides"].execute
    mkdir_p "gh-pages"
    sh "cp -r CNAME gh-pages/"
#    sh "git rm -f -r ."
#    mkdir_p "gh-pages"
    sh "cp -r slides/* gh-pages/"
#    sh "rm -r slides"
    sh "git add -f gh-pages"
    sh "tree=$(git write-tree --prefix=gh-pages/) && commit=$(echo \"Generated docs\" | git commit-tree $tree -p gh-pages) && git update-ref refs/heads/gh-pages $commit && git reset HEAD"
    sh "if [ -d slides ]; then rm -r slides; fi"
    sh "if [ -d gh-pages ]; then rm -r gh-pages; fi"
    sh "git reset --hard"
    puts "Now run git push origin gh-pages"
  else
    $stderr.puts "Repository is not clean, git commit to continue"
  end
end
