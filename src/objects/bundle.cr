require "json"
require "./properties/type"
require "./properties/id"
require "./indicator"
require "./identity"
require "./attack_pattern"
require "./relationship"
require "./infrastructure"
require "./malware"
require "./url"
require "./ipv4_addr"
require "./domain_name"

alias STIX2::Type::BundleObjects = Array(STIX2::Indicator | STIX2::Identity | STIX2::AttackPattern | STIX2::Relationship | STIX2::Infrastructure | STIX2::Malware | STIX2::Url | STIX2::DomainName | STIX2::IPv4Addr)

class STIX2::Bundle
  include JSON::Serializable
  include STIX2::Properties::TypeProperty
  include STIX2::Properties::IDProperty

  getter objects : STIX2::Type::BundleObjects?

  def initialize
    object_type = "bundle"
    @object_type = object_type
    new_ID object_type
  end

  private def init_objects
    @objects ||= STIX2::Type::BundleObjects.new
  end

  def objects
    init_objects
  end
end
