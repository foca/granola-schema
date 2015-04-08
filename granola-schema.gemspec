require "./lib/granola/schema/version"

Gem::Specification.new do |s|
  s.name        = "granola-schema"
  s.licenses    = ["MIT"]
  s.version     = Granola::Schema::VERSION
  s.summary     = "Granola::Schema adds JSON schema support to Granola"
  s.description = "Handles JSON Schema support for Granola serializers."
  s.authors     = ["Nicolas Sanguinetti"]
  s.email       = ["contacto@nicolassanguinetti.info"]
  s.homepage    = "http://github.com/foca/granola"

  s.files = Dir[
    "LICENSE",
    "README.md",
    "lib/granola/schema.rb",
    "lib/granola/schema/version.rb",
  ]

  s.add_runtime_dependency "granola", ">= 0.10", "< 2.0"
  s.add_runtime_dependency "json-schema", "~> 2.2"

  s.add_development_dependency "cutest", "~> 1.2"
end
