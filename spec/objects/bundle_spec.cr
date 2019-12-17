describe STIX2::Bundle do
  bundle = STIX2::Bundle.new

  Spec.before_each do
    bundle = STIX2::Bundle.new
  end

  describe "#objects" do
    indicator = STIX2::Indicator.new({
      indicator_types: ["anonymization"],
      pattern:         "[]",
      pattern_type:    "",
      valid_from:      "",
    })

    identity = STIX2::Identity.new({
      name:           "name",
      identity_class: "",
    })

    attack_pattern = STIX2::AttackPattern.new({name: "AttackPatternName"})

    domain_name = STIX2::DomainName.new({
      value: "example.com",
    })

    infrastructure = STIX2::Infrastructure.new({
      name:                 "infrastructure",
      infrastructure_types: ["command-and-control"],
    })

    ipv4_addr = STIX2::IPv4Addr.new({
      value: "192.0.2.0",
    })

    malware = STIX2::Malware.new({
      malware_types: ["ransomware"],
      is_family:     true,
    })

    relationship_type = "resolves-to"
    source_ref = domain_name.id.to_s
    target_ref = ipv4_addr.id.to_s
    relationship = STIX2::Relationship.new({
      relationship_type: relationship_type,
      source_ref:        source_ref,
      target_ref:        target_ref,
    })

    url = STIX2::Url.new({
      value: "http://example.com",
    })

    it "After create should returns empty array" do
      bundle.objects.should eq STIX2::Type::BundleObjects.new
    end

    it "Should be possible to append an element" do
      bundle.objects << indicator
      bundle.objects << attack_pattern
      bundle.objects << domain_name
      bundle.objects << identity
      bundle.objects << indicator
      bundle.objects << infrastructure
      bundle.objects << ipv4_addr
      bundle.objects << malware
      bundle.objects << relationship
      bundle.objects << url

      bundle.objects.should eq [indicator, attack_pattern, domain_name, identity, indicator, infrastructure, ipv4_addr, malware, relationship, url]
    end

    it "Should be possible to append an array of elements" do
      bundle.objects << [
        indicator,
        attack_pattern,
        domain_name,
        identity,
        indicator,
        infrastructure,
        ipv4_addr,
        malware,
        relationship,
        url,
      ]

      bundle.objects.should eq [indicator, attack_pattern, domain_name, identity, indicator, infrastructure, ipv4_addr, malware, relationship, url]
    end
  end

  describe "#id" do
    it "Should have correct id" do
      bundle.id.should match(/^bundle--/)
    end
  end

  describe "#object_type" do
    it "Should have correct object_type" do
      bundle.object_type.should eq "bundle"
    end
  end

  describe "#to_json" do
    it "Should succeed" do
      bundle.objects
      bundle.to_json.should eq "{\"id\":\"#{bundle.id}\",\"type\":\"bundle\",\"objects\":[]}"
    end
  end
end
