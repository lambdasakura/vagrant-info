# -*- encoding: utf-8 -*-
require File.expand_path("../lib/vagrant-info/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "vagrant-info"
  s.version     = VagrantInfo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["lambda_sakura"]
  s.email       = ["lambda.sakura@gmail.com"]
  s.homepage    = "http://github.com/lambdasakura/vagrant-info/"
  s.summary     = %q{Get Vagrant box infomation}
  s.description = %q{Allows you to get infomation about your vagrant}

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "vagrant-info"

#  s.add_dependency "popen4", "~> 0.1.2"
#  s.add_dependency "thor", "> 0.14"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
