require "uuid"
require "json"

module STIX2::Properties::IDProperty
  include JSON::Serializable

  getter id : String?

  def new_id(s : String)
    @id = create_stixuuid(s)
  end

  private def create_stixuuid(s : String) : String
    "#{s}--#{UUID.random}"
  end
end
