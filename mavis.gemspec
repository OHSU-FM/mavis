# -*- encoding: utf-8 -*-
require File.expand_path("../lib/mavis/version", __FILE__)

Gem::Specification.new do |spec|
  spec.add_dependency "httparty", "~> 0.14.0"
  spec.add_dependency "naught", "~> 1.0"
  spec.add_development_dependency "bundler", "~> 1.0"
  spec.authors = ["William Eichelberger"]
  spec.description = "A Ruby interface to the MedHub API."
  spec.email = %w(eichelbw@ohsu.edu)
  spec.files = %w(README.md mavis.gemspec) + Dir["lib/**/*.rb"]
  spec.homepage = "https://github.com/ohsu-fm/mavis"
  spec.licenses = %w(MIT)
  spec.name = "mavis"
  spec.require_paths = %w(lib)
  spec.required_ruby_version = ">= 1.9.3"
  spec.summary = spec.description
  spec.version = Mavis::Version
end
