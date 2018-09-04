task :herokudb do
  exec 'heroku pg:reset DATABASE --confirm dog-rescue && heroku run rake db:migrate && heroku run rake db:seed'
end
