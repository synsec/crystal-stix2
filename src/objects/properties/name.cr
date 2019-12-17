require "json"

module STIX2::Properties::NameProperty
  include JSON::Serializable

  property name : String?
end
