# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "peek-elasticsearch"
  spec.version       = "0.2.0"
  spec.authors       = ["Will Farrington"]
  spec.email         = ["wfarr@github.com"]
  spec.description   = %q{Take a peek into your Elasticsearch indices.}
  spec.summary       = %q{Take a peek into your Elasticsearch indices.}
  spec.homepage      = "https://github.com/wfarr/peek-elasticsearch"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "stretch", "~> 0.1.3"

  spec.add_development_dependency "bundler", "~> 1.2"
  spec.add_development_dependency "rake"
end
