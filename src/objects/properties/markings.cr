require "../granular_marking"
require "../../macro/create_methods"

module STIX2::Properties::MarkingProperty
  include STIX2::Macro::CreateMethods

  setter object_marking_refs : Array(String)?
  setter granular_markings : Array(STIX2::GranularMarking)?

  def object_marking_refs
    @object_marking_refs ||= [] of String
  end

  def granular_markings
    @granular_markings ||= [] of STIX2::GranularMarking
  end
end
