# frozen_string_literal: true

require 'rubocop/rake_task'
require 'rake/testtask'

task default: %w[lint test]

Rake::TestTask.new('test:all') do |t|
  t.libs = ['src']
  t.warning = true
  t.test_files = FileList['test/**/*_test.rb']
end

task :test do
  ruby 'test/example_test.rb'
  ruby 'test/model/cell_test.rb'
  ruby 'test/model/board_test.rb'
  ruby 'test/controller/game_controller_test.rb'
  ruby 'test/utils/board_creators_test.rb'
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['src/**/*.rb', 'test/**/*.rb']
end
