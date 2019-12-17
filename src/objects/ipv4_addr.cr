require "json"
require "./properties/basic_common_object_properties"
require "./properties/sco_common_object_properties"
require "./properties/markings"
require "./properties/value"

class STIX2::IPv4Addr
  include JSON::Serializable
  include STIX2::Properties::BasicCommonObjectProperties
  include STIX2::Properties::SCOCommonObjectProperties
  include STIX2::Properties::MarkingProperty

  property value : String

  def initialize(@value : String)
    init_basic_object("ipv4-addr")
  end

  def initialize(args : NamedTuple(value: String))
    @value = args[:value]
    init_basic_object("ipv4-addr")
  end
end
