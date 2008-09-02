require 'rubygems'
require 'hoe'
require './lib/verbal.rb'
require 'spec/rake/spectask'

Hoe.new('verbal', Verbal::VERSION) do |p|
  p.rubyforge_name = 'verbal'
  p.developer('Tomasz Mazur', 'tomek@trix.pl')
end

Spec::Rake::SpecTask.new(:spec) do |t|
  t.verbose = false
end

task :default => :spec