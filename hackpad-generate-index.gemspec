# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hackpad/generate/index/version'

Gem::Specification.new do |spec|
  spec.name          = "hackpad-generate-index"
  spec.version       = Hackpad::Generate::Index::VERSION
  spec.authors       = ["Doni Leung"]
  spec.email         = ["d@ii2d.com"]

  spec.summary       = %q{Hackpad generate index.}
  spec.description   = %q{A tool for generate index for hackpad via hackpad API.}
  spec.homepage      = "https://github.com/kudelabs/hackpad-generate-index.git."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # spec.bindir        = "exe"
  spec.executables   = ['hackpad-generate-index'] #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'oauth', "~> 0.5.1"
  spec.add_dependency 'thor', "~> 0.19.1"
  spec.add_dependency 'nokogiri', "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 8.2"
  spec.add_development_dependency "simplecov", "~> 0"
end
