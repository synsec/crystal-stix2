require "json"

class STIX2::KillChainPhase
  include JSON::Serializable

  property kill_chain_name : String
  property phase_name : String

  def initialize(@kill_chain_name : String, @phase_name : String)
  end

  def initialize(args : NamedTuple(kill_chain_name: String, phase_name: String))
    @kill_chain_name = args[:kill_chain_name]
    @phase_name = args[:phase_name]
  end
end
