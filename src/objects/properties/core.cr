require "json"
require "uuid"

module STIX2::Properties
  class Core
    include JSON::Serializable

    getter id : String
    @[JSON::Field(key: "type")]
    getter object_type : String

    def initialize(@object_type : String)
      @id = create_stixuuid(@object_type)
    end

    private def create_stixuuid(s : String) : String
      "#{s}--#{UUID.random}"
    end
  end
end
