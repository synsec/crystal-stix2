require "json"

module STIX2::Properties::SeenProperties
  include JSON::Serializable

  property first_seen : String?
  property last_seen : String?
end
