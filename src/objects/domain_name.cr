require "json"
require "./properties/basic_common_object_properties"
require "./properties/sco_common_object_properties"
require "./properties/markings"

class STIX2::DomainName
  include JSON::Serializable
  include STIX2::Properties::BasicCommonObjectProperties
  include STIX2::Properties::SCOCommonObjectProperties
  include STIX2::Properties::MarkingProperty

  property value : String

  def initialize(@value : String)
    init_basic_object("domain-name")
  end

  def initialize(args : NamedTuple(value: String))
    @value = args[:value]
    init_basic_object("domain-name")
  end
end
