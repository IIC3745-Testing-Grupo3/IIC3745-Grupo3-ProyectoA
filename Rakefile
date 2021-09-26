# frozen_string_literal: true

require 'rubocop/rake_task'

task default: %w[lint test]

task :test do
  ruby 'test/example_test.rb'
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['src/**/*.rb', 'src/**/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
end
