require "json"
require "./type"
require "./id"

module STIX2::Properties::BasicCommonObjectProperties
  include JSON::Serializable
  include STIX2::Properties::IDProperty
  include STIX2::Properties::TypeProperty

  property spec_version : String?

  def init_basic_object(object_type : String)
    @spec_version = STIX2::Constants::STIX_VERSION
    @object_type = object_type

    new_id(object_type)
  end
end
