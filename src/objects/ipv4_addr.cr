require "./properties/basic_common"
require "./properties/sco_common_object_properties"
require "./properties/markings"
require "./properties/value"

class STIX2::IPv4Addr < STIX2::Properties::BasicCommon
  include STIX2::Properties::SCOCommonObjectProperties
  include STIX2::Properties::MarkingProperty

  property value : String

  def initialize(@value : String)
    super("ipv4-addr")
  end

  def initialize(args : NamedTuple(value: String))
    @value = args[:value]
    super("ipv4-addr")
  end
end
