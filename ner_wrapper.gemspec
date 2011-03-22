# -*- encoding: utf-8 -*-
require File.expand_path("../lib/ner/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "ner_wrapper"
  s.version     = NER::Version
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Jason Kim']
  s.summary     = "Wrapper for Stanford Name Entity Recognizer"
  
  s.required_rubygems_version = ">= 1.3.6"
  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'

  # certain versions of rjb do not work
  s.add_runtime_dependency("rjb", ["1.3.0"])
  s.add_runtime_dependency("nokogiri", ["~> 1.4.4"])
  
  s.add_development_dependency("shoulda-context")
end
