require "json"

module STIX2::Properties::DescriptionProperty
  include JSON::Serializable

  property description : String?
end
