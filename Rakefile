require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

Cucumber::Rake::Task.new(:beta3) do |t|
  t.profile = 'default'
  t.cucumber_opts = '--tags @beta3'
end

task :default => :features