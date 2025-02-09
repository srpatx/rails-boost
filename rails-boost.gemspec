require_relative "lib/rails/boost/version"

Gem::Specification.new do |spec|
  spec.name          = "rails-boost"
  spec.version       = Rails::Boost::VERSION
  spec.authors       = ["Grant Hutchins", "Adam Milligan"]
  spec.email         = ["gems@nertzy.com", "adam@buildgroundwork.com"]

  spec.summary       = "Improvements to Rails"
  spec.homepage      = "https://github.com/srpatx/rails-boost"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency("io-like", "~> 0.3")
  spec.add_dependency("rails", ">= 6.1", "< 8")

  spec.add_development_dependency("pg")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("rspec")
  spec.add_development_dependency("rspec-its")
end

