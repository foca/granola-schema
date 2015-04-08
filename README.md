# Granola &lt;3 JSON Schema [![Build Status](https://img.shields.io/travis/foca/granola-schema.svg)](https://travis-ci.org/foca/granola-schema) [![RubyGem](https://img.shields.io/gem/v/granola-schema.svg)](https://rubygems.org/gems/granola-schema)

Support for defining [JSON schema][schema] for your Granola serializers.

[schema]: http://json-schema.org

## Example

``` ruby
require "granola/schema"

class PersonSerializer < Granola::Serializer
  def self.schema
    {
      "type" => "object",
      "required" => ["name", "email"],
      "properties" => {
        "name" => { "type" => "string" },
        "email" => { "type" => "string" },
        "age" => { "type" => "integer" },
      }
    }
  end

  def data
    {
      "name" => object.name,
      "email" => object.email,
      "age" => object.age
    }
  end
end

serializer = PersonSerializer.new(person)
serializer.valid? #=> true
```

## Install

    gem install granola-schema

## License

This project is shared under the MIT license. See the attached [LICENSE][] file
for details.

[LICENSE]: ./LICENSE
