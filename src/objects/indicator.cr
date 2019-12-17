require "json"
require "./properties/common_object_properties"
require "./properties/name"
require "./properties/description"
require "./properties/kill_chain_phases"
require "../macro/create_methods"

class STIX2::Indicator
  include JSON::Serializable
  include STIX2::Properties::CommonObjectProperties
  include STIX2::Properties::NameProperty
  include STIX2::Properties::DescriptionProperty
  include STIX2::Properties::KillChainPhasesProperty
  include STIX2::Macro::CreateMethods

  setter indicator_types : Array(String)
  property pattern : String
  property pattern_type : String
  property pattern_version : String?
  property valid_from : String
  property valid_until : String?

  def initialize(@indicator_types : Array(String), @pattern : String, @pattern_type : String, @valid_from : String)
    init_object("indicator")
  end

  def initialize(args : NamedTuple(indicator_types: Array(String), pattern: String, pattern_type: String, valid_from: String))
    @indicator_types = args[:indicator_types]
    @pattern = args[:pattern]
    @pattern_type = args[:pattern_type]
    @valid_from = args[:valid_from]

    init_object("indicator")
  end

  define_add_methods indicator_types
end
