require "json"
require "../external_reference"
require "../../macro/create_methods"

module STIX2::Properties::ExternalReferencesProperty
  include JSON::Serializable
  include STIX2::Macro::CreateMethods

  setter external_references : Array(STIX2::ExternalReference)?

  def external_references
    @external_references ||= [] of STIX2::ExternalReference
  end
end
