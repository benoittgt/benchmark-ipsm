# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'benchmark/ipsm/version'

Gem::Specification.new do |spec|
  spec.name          = "benchmark-ipsm"
  spec.version       = Benchmark::Ipsm::VERSION
  spec.authors       = ["Benoit Tigeot"]
  spec.email         = ["benoit@hopsandfork.com"]

  spec.summary       = %q{Benchmark IPS with memory delta}
  spec.description   = %q{Benchmark IPS with memory delta}
  spec.homepage      = "https://github.com/benoittgt/benchmark-ipsm"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'benchmark-ips', '~> 2.5.0'
  spec.add_dependency 'get_process_mem', '~> 0.2.1'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
