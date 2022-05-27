# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "aserto-grpc-authz"
  spec.version       = "0.0.1"
  spec.authors       = ["Aserto"]
  spec.email         = ["aserto@aserto.com"]

  spec.summary       = "Aserto Authorizer GRPC §Client"
  spec.description   = "Ruby generated GRPC client for Aserto Authorizer"
  spec.homepage      = "https://www.aserto.com"
  spec.license       = "Apache-2.0"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/aserto-dev/ruby-grpc-authz"
  spec.metadata["changelog_uri"] = "https://github.com/aserto-dev/ruby-grpc-authz"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"

  # runtime dependencies
  spec.add_runtime_dependency "grpc", "~> 1.46"

  # development dependencies
  spec.add_development_dependency "grpc_mock", "~> 0.4"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-rspec", "~> 2.11"
end
