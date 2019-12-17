require "json"

module STIX2::Properties::ValueProperty
  include JSON::Serializable

  property value : String?
end
