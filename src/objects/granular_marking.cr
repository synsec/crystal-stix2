require "json"
require "./properties/lang"

class STIX2::GranularMarking
  include JSON::Serializable
  include STIX2::Properties::LangProperty

  property marking_ref : String?
  getter selectors : Array(String)

  def initialize(@selectors : Array(String))
  end
end
