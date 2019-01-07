# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'onesignal/version'

Gem::Specification.new do |spec|
  spec.name          = 'onesignal-ruby'
  spec.version       = OneSignal::VERSION
  spec.authors       = ['Matteo Joliveau']
  spec.email         = ['matteo.joliveau@mikamai.com']

  spec.summary       = 'Ruby wrapper to OneSignal API'
  spec.description   = 'Ruby wrapper to OneSignal API, mapping to Plain Old Ruby Objects'
  spec.homepage      = 'https://github.com/mikamai/onesignal-ruby'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'dotenv', '~> 2.5'
  spec.add_development_dependency 'factory_bot', '~> 4.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'vcr', '~> 4.0.0'
  spec.add_development_dependency 'webmock', '~> 3.4'

  spec.add_runtime_dependency 'activesupport', '~> 5.2.2'
  spec.add_runtime_dependency 'faraday', '~> 0.15.4'
  spec.add_runtime_dependency 'simple_command', '~> 0.0.9'
end
