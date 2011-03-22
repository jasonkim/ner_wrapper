require 'test/unit'
require 'shoulda-context'
require File.expand_path(File.join(File.dirname(__FILE__), '/../lib/ner'))
begin
  require File.expand_path(File.join(File.dirname(__FILE__), '/../.test_config'))
rescue LoadError
  puts "You must create .test_config in this project to run the test"
  puts "The file should define NER_JAR_PATH and CLASSIFIER_FILE constants"
  puts "See test_config_example.rb"
  exit 1
end
