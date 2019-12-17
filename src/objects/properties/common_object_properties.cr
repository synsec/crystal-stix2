require "json"
require "./basic_common_object_properties"
require "./labels"
require "./lang"
require "./markings"
require "./created_modified"
require "./external_references"
require "../../constants/constants"

module STIX2::Properties::CommonObjectProperties
  include JSON::Serializable
  include STIX2::Properties::BasicCommonObjectProperties
  include STIX2::Properties::LabelsProperty
  include STIX2::Properties::CreatedModifiedProperty
  include STIX2::Properties::ExternalReferencesProperty
  include STIX2::Properties::LangProperty
  include STIX2::Properties::MarkingProperty

  property revoked : Bool?
  property created_by_ref : String?
  property confidence : Int64? | Int32?

  def init_object(object_type : String)
    init_basic_object(object_type)
    set_сreated_to_current_time
    set_modified_to_created
  end
end
