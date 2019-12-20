require "./properties/core"
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

class STIX2::Bundle < STIX2::Properties::Core
  getter objects : STIX2::Type::BundleObjects?

  def initialize
    super("bundle")
  end

  def objects
    @objects ||= STIX2::Type::BundleObjects.new
  end
end
