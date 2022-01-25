lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ggtranslate/version"

Gem::Specification.new do |spec|
  spec.name = "ggtranslate"
  spec.version = Ggtranslate::VERSION
  spec.authors = ["Thien Tran"]
  spec.email = ["webmaster3t@gmail.com"]

  spec.summary = %q{ lightweight gem to bypass google translate }
  spec.description = %q{ use google translate service without struggles}
  spec.homepage = "https://github.com/thien0291/ggtranslate"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/thien0291/ggtranslate"
    spec.metadata["changelog_uri"] = "https://github.com/thien0291/ggtranslate/changelogs.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
          "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2.22"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "byebug", "~> 11.1.3"
  spec.add_dependency "rest-client", "~> 2.1"
  spec.add_dependency "addressable"
end
