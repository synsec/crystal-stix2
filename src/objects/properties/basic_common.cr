require "./core"

module STIX2::Properties
  class BasicCommon < STIX2::Properties::Core
    getter spec_version : String

    def initialize(object_type : String)
      super(object_type)
      @spec_version = STIX2::Constants::STIX_VERSION
    end
  end
end
