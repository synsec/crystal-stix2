require "json"
require "./properties/common_object_properties"
require "./properties/description"
require "./properties/aliases"
require "./properties/kill_chain_phases"

class STIX2::AttackPattern
  include JSON::Serializable
  include STIX2::Properties::CommonObjectProperties
  include STIX2::Properties::DescriptionProperty
  include STIX2::Properties::AliasesProperty
  include STIX2::Properties::KillChainPhasesProperty

  property name : String

  def initialize(@name : String)
    init_object("attack-pattern")
  end

  def initialize(args : NamedTuple(name: String))
    @name = args[:name]
    init_object("attack-pattern")
  end
end
