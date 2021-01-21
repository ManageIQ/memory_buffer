# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'memory_buffer/version'

Gem::Specification.new do |spec|
  spec.name          = "memory_buffer"
  spec.version       = MemoryBuffer::VERSION
  spec.authors       = ["Rich Oliveri", "Oleg Barenboim", "Jason Frey"]
  spec.email         = ["roliveri@redhat.com", "chessbyte@gmail.com", "fryguy9@gmail.com"]

  spec.summary       = %q{Ruby module to create memory buffers on Linux platforms.}
  spec.description   = %q{Ruby module to create memory buffers on Linux platforms.}
  spec.homepage      = "http://github.com/ManageIQ/memory_buffer"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.extensions    = ["ext/memory_buffer/extconf.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "manageiq-style"
  spec.add_development_dependency "rake",          ">= 12.3.3"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "rspec"
end
