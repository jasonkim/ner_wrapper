$LOAD_PATH.unshift 'lib'

task :default => :test

desc "Run tests"
task :test do
  Dir['test/unit/*_test.rb'].each do |f|
    puts File.expand_path(f)
    require File.expand_path(f)
  end
end