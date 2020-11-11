lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crawler/address/providers/gouv_fr/version'

Gem::Specification.new do |spec|
  spec.name          = 'crawler-address-gouv-fr'
  spec.version       = Crawler::Address::Providers::GouvFr::VERSION
  spec.authors       = ['Jonathan PHILIPPE']
  spec.email         = ['jonathan@cinema.paris']

  spec.summary       = %q{}
  spec.description   = %q{}
  spec.homepage      = 'https://crawler.cinema.paris'
  spec.license       = 'CC-BY-SA-4.0'

  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/cinema-paris/crawler-address-gouv-fr'
    spec.metadata['changelog_uri'] = 'https://github.com/cinema-paris/crawler-address-gouv-fr/CHANGELOG.md'
  end

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_runtime_dependency 'faraday', '>= 0.15'
  spec.add_runtime_dependency 'crawler-address-core', '~> 1.0'
end
