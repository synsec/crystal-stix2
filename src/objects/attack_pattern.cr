require "./properties/common"
require "./properties/description"
require "./properties/aliases"
require "./properties/kill_chain_phases"

class STIX2::AttackPattern < STIX2::Properties::Common
  include STIX2::Properties::DescriptionProperty
  include STIX2::Properties::AliasesProperty
  include STIX2::Properties::KillChainPhasesProperty

  property name : String

  def initialize(@name : String)
    super("attack-pattern")
  end

  def initialize(args : NamedTuple(name: String))
    @name = args[:name]
    super("attack-pattern")
  end
end
