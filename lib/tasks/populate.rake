# -*- mode: ruby -*-

desc "Re-create then run database migrations and load dummy data for development"
task :populate_cold => :environment do
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke

  Rake::Task['db:seed'].invoke  
  Rake::Task['db:populate'].invoke
end

desc "Re-create then load the database schema and dummy data for development"
task :populate => :environment do
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:setup'].invoke

  Rake::Task['db:seed'].invoke    
  Rake::Task['db:populate'].invoke
end

namespace :db do
  desc "Setup the application and fill database with demo data"
  task :populate => :environment do
    Rake::Task['db:populate_numbers'].invoke
  end # task :populate

  desc "Fill database with numbers"
  task :populate_numbers  => :environment do
    require 'faker'
    Sequence.all.each do |s|
      (100+rand(80)).times do |i|
        desc = "#{Faker::Name.material} #{%w(OD L W H Size val n s m M #).sample}#{rand(99)} #{Faker::Name.mechanical}"
        NumberFactory.new(sequence_id: s.id, descriptor: desc).create
      end
    end
  end

end
