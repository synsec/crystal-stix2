require "uuid"
require "json"

module STIX2::Properties::IDProperty
  include JSON::Serializable

  getter id : String?

  def new_ID(s : String)
    @id = create_STIXUUID(s)
  end

  private def create_STIXUUID(s : String) : String
    "#{s}--#{UUID.random}"
  end
end
