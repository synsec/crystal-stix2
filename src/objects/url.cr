require "./properties/basic_common"
require "./properties/sco_common_object_properties"
require "./properties/markings"

class STIX2::Url < STIX2::Properties::BasicCommon
  include STIX2::Properties::SCOCommonObjectProperties
  include STIX2::Properties::MarkingProperty

  property value : String

  def initialize(@value : String)
    super("url")
  end

  def initialize(args : NamedTuple(value: String))
    @value = args[:value]
    super("url")
  end
end
