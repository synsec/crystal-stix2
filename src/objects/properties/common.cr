require "./basic_common"
require "./labels"
require "./lang"
require "./markings"

require "./external_references"
require "../../constants/constants"
require "time"

module STIX2::Properties
  class Common < STIX2::Properties::BasicCommon
    include STIX2::Properties::LabelsProperty
    include STIX2::Properties::ExternalReferencesProperty
    include STIX2::Properties::LangProperty
    include STIX2::Properties::MarkingProperty

    property revoked : Bool?
    property created_by_ref : String?
    property confidence : Int64? | Int32?

    property created : String
    property modified : String

    def initialize(object_type : String)
      @created = Time.utc.to_rfc3339
      @modified = @created
      super(object_type)
    end
  end
end
