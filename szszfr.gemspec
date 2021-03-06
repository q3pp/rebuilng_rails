# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'szszfr/version'

Gem::Specification.new do |spec|
  spec.name          = "szszfr"
  spec.version       = Szszfr::VERSION
  spec.authors       = ["Artem"]
  spec.email         = ["q3pp@yandex.ru"]

  spec.summary       = %q{My first framework.}
  spec.description   = %q{framework is written with book.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency "erubis"
  spec.add_runtime_dependency "json"

  spec.add_runtime_dependency 'rack'
end
