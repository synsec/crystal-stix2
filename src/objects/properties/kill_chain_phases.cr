require "../../macro/create_methods"
require "../kill_chain_phase"

module STIX2::Properties::KillChainPhasesProperty
  include STIX2::Macro::CreateMethods

  setter kill_chain_phases : Array(STIX2::KillChainPhase)?

  def kill_chain_phases
    @kill_chain_phases ||= [] of STIX2::KillChainPhase
  end
end
