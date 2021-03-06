require "granola/schema"

class PersonSerializer < Granola::Serializer
  def self.schema
    {
      "type" => "object",
      "required" => ["name"],
      "properties" => {
        "name" => { "type" => "string" },
        "age" => { "type" => "integer" }
      }
    }
  end
end

test "validates a person with valid age" do
  person = Person.new("John Doe", 29)
  serializer = PersonSerializer.new(person)
  assert serializer.valid?
end

test "validates a person with an invalid (non-integer) age" do
  person = Person.new("John Doe", "old")
  serializer = PersonSerializer.new(person)
  assert !serializer.valid?
  assert serializer.validation_errors.any?
end

test "can serialize the schema itself" do
  serializer = Granola::SchemaSerializer.new(PersonSerializer.schema)

  assert_equal \
    "http://json-schema.org/schema#",
    serializer.data["$schema"]

  assert_equal "object", serializer.data["type"]
  assert_equal ["name"], serializer.data["required"]
  assert_equal(
    { "type" => "integer" },
    serializer.data["properties"]["age"]
  )
end

test "serializes the schema with the appropriate MIME type" do
  serializer = Granola::SchemaSerializer.new(PersonSerializer.schema)
  assert_equal "application/schema+json", serializer.mime_type
end
