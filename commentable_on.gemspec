require_relative "lib/commentable_on/version"

Gem::Specification.new do |spec|
  spec.name = "commentable_on"
  spec.version = CommentableOn::VERSION
  spec.authors = ["Samuel Ralak"]
  spec.email = ["thesamuelralak@gmail.com"]

  spec.summary = "Provides comment functionality with replies"
  spec.description = "Placeholder description text explaining how commentable on steroids will save the world in 5 words or less"
  spec.homepage = "https://github.com/samuelralak/commentable-on"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/samuelralak/commentable-on"
  spec.metadata["changelog_uri"] = "https://github.com/samuelralak/commentable-on"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "sqlite3", "~> 1.5"
  spec.add_development_dependency "factory_bot", "~> 6.2"
end
