require "./properties/common"
require "./properties/description"
require "./properties/kill_chain_phases"
require "./properties/aliases"
require "./properties/seen"
require "../macro/create_methods"

class STIX2::Infrastructure < STIX2::Properties::Common
  include STIX2::Properties::DescriptionProperty
  include STIX2::Properties::KillChainPhasesProperty
  include STIX2::Properties::AliasesProperty
  include STIX2::Properties::SeenProperties
  include STIX2::Macro::CreateMethods

  property name : String
  setter infrastructure_types : Array(String)

  def initialize(@name : String, @infrastructure_types : Array(String))
    super("infrastructure")
  end

  def initialize(args : NamedTuple(name: String, infrastructure_types: Array(String)))
    @name = args[:name]
    @infrastructure_types = args[:infrastructure_types]
    super("infrastructure")
  end

  define_add_methods infrastructure_types
end
