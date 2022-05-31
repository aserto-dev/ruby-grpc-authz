# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "aserto-grpc-authz"
  spec.version       = File.read(File.join(__dir__, "VERSION")).chomp
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

  dirs =
    Dir[File.join(__dir__, "README.md")] +
    Dir[File.join(__dir__, "CHANGELOG.md")] +
    Dir[File.join(__dir__, "LICENSE")] +
    Dir[File.join(__dir__, "VERSION")] +
    Dir[File.join(__dir__, "lib/**/*.rb")] +
    Dir[File.join(__dir__, "generated/**/*.rb")]

  spec.files = dirs.map { |path| path.sub("#{__dir__}#{File::SEPARATOR}", "") }

  spec.require_paths = %w[lib generated]
  spec.metadata["rubygems_mfa_required"] = "true"

  # runtime dependencies
  spec.add_runtime_dependency "grpc", "~> 1.46"

  # development dependencies
  spec.add_development_dependency("bundler", ">= 1.15.0", "< 3.0")
  spec.add_development_dependency "grpc_mock", "~> 0.4"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-rspec", "~> 2.11"
end
