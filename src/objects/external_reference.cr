require "json"

class STIX2::ExternalReference
  include JSON::Serializable

  property source_name : String
  property description : String?
  property url : String?
  property hashes : Hash(String, String)?
  property external_id : String?

  def initialize(@source_name : String)
  end
end
