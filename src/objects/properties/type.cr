require "json"

module STIX2::Properties::TypeProperty
  include JSON::Serializable

  @[JSON::Field(key: "type")]
  getter object_type : String?
end
