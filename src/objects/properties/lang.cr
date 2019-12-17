require "json"

module STIX2::Properties::LangProperty
  include JSON::Serializable

  property lang : String?
end
