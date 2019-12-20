require "./properties/common"
require "./properties/description"

class STIX2::Relationship < STIX2::Properties::Common
  include STIX2::Properties::DescriptionProperty

  property relationship_type : String
  property source_ref : String
  property target_ref : String
  property start_time : String?
  property stop_time : String?

  def initialize(@relationship_type : String, @source_ref : String, @target_ref : String)
    super("relationship")
  end

  def initialize(args : NamedTuple(relationship_type: String, source_ref: String, target_ref: String))
    @relationship_type = args[:relationship_type]
    @source_ref = args[:source_ref]
    @target_ref = args[:target_ref]

    super("relationship")
  end
end
