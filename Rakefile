require 'rubygems'
require 'bundler'
require 'yard'
require 'yard/rake/yardoc_task'


Bundler::GemHelper.install_tasks


YARD::Rake::YardocTask.new(:yardoc) do |y|
  y.options = ["--output-dir", "yardoc"]
end
