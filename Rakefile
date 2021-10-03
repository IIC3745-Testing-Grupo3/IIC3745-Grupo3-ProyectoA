# frozen_string_literal: true

require 'rubocop/rake_task'

task default: %w[lint test]

task :test do
  ruby 'test/example_test.rb'
  ruby 'test/model/cell_test.rb'
  ruby 'test/model/board_test.rb'
  ruby 'test/utils/board_creators_test.rb'
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['src/**/*.rb', 'test/**/*.rb']
end
