require "../spec_helper"

describe STIX2::Infrastructure do
  obj = STIX2::Infrastructure.new({
    name:                 "infrastructure",
    infrastructure_types: ["command-and-control"],
  })

  obj = STIX2::Infrastructure.new("infrastructure", ["command-and-control"])

  Spec.before_each do
    obj = STIX2::Infrastructure.new({
      name:                 "infrastructure",
      infrastructure_types: ["command-and-control"],
    })
  end

  describe "Required Common Properties" do
    it "Should have correct created and modified" do
      obj.created.should_not be_nil
      obj.created.should_not be_empty

      obj.modified.should_not be_nil
      obj.modified.should_not be_empty
    end

    it "Should have correct spec_version" do
      obj.spec_version.should eq "2.1"
    end

    it "Should have correct id" do
      obj.id.should match(/^infrastructure--/)
    end

    it "Should have correct object_type" do
      obj.object_type.should eq "infrastructure"
    end
  end

  describe "Optional Common Properties" do
    describe "#created_by_ref" do
      it "Should be modifiable" do
        str = "identity--f431f809-377b-45e0-aa1c-6a4751cae5ff"

        obj.created_by_ref = str
        obj.created_by_ref.should be str
      end
    end

    describe "#revoked" do
      it "Should be modifiable" do
        res = false

        obj.revoked = res
        obj.revoked.should eq res
      end
    end

    describe "#labels" do
      res = "iot"

      it "Should be empty right after object creation" do
        obj.labels.should eq [] of String
      end

      it "Should be possible to append an element" do
        obj.labels << res
        obj.labels.should eq [res]
      end

      it "Should be possible to append an array of elements" do
        obj.labels << res
        obj.labels.should eq [res]
      end
    end

    describe "#confidence" do
      it "Should be modifiable" do
        res = 0

        obj.confidence = res
        obj.confidence.should eq res
      end
    end

    describe "#lang" do
      it "Should be modifiable" do
        res = "en"

        obj.lang = res
        obj.lang.should eq res
      end
    end

    describe "#external_references" do
      res = STIX2::ExternalReference.new("http://example.com")

      it "Should be empty right after object creation" do
        obj.external_references.should eq [] of STIX2::ExternalReference
      end

      it "Should be possible to append an element" do
        obj.external_references << res
        obj.external_references.should eq [res]
      end

      it "Should be possible to append an array of elements" do
        obj.external_references << [res]
        obj.external_references.should eq [res]
      end
    end

    describe "#object_marking_refs" do
      res = "marking-definition--089a6ecb-cc15-43cc-9494-767639779123"

      it "Should be empty right after object creation" do
        obj.object_marking_refs.should eq [] of String
      end

      it "Should be possible to append an element" do
        obj.object_marking_refs << res
        obj.object_marking_refs.should eq [res]
      end

      it "Should be possible to append an array of elements" do
        obj.object_marking_refs << [res]
        obj.object_marking_refs.should eq [res]
      end
    end

    describe "#granular_markings" do
      res = STIX2::GranularMarking.new(["description", "labels"])

      it "Should be empty right after object creation" do
        obj.granular_markings.should eq [] of STIX2::GranularMarking
      end

      it "Should be possible to append an element" do
        obj.granular_markings << res
        obj.granular_markings.should eq [res]
      end

      it "Should be possible to append an array of elements" do
        obj.granular_markings << [res]
        obj.granular_markings.should eq [res]
      end
    end

    describe "Infrastructure Specific Properties" do
      describe "#name" do
        it "Should be modifiable" do
          res = "Smominru C2"

          obj.name = res
          obj.name.should eq res
        end
      end

      describe "#description" do
        it "Should be modifiable" do
          res = "Attacker description"

          obj.description = res
          obj.description.should eq res
        end
      end

      describe "#infrastructure_types" do
        res = "anomalous-activity"

        it "Should be empty right after object creation" do
          obj.infrastructure_types.should eq ["command-and-control"]
        end

        it "Should be possible to append an element" do
          obj.infrastructure_types << res
          obj.infrastructure_types.should eq ["command-and-control", res]
        end

        it "Should be possible to append an array of elements" do
          obj.infrastructure_types << [res]
          obj.infrastructure_types.should eq ["command-and-control", res]
        end
      end

      describe "#aliases" do
        res = "anomalous-activity"

        it "Should return array empty if just inited" do
          obj.aliases.should eq [] of String
        end

        it "Should be possible to append an element" do
          obj.aliases << res
          obj.aliases.should eq [res]
        end

        it "Should be possible to append an array of elements" do
          obj.aliases << [res]
          obj.aliases.should eq [res]
        end
      end

      describe "#kill_chain_phases" do
        res = STIX2::KillChainPhase.new("lockheed-martin-cyber-kill-chain", "reconnaissance")

        it "Should be empty right after object creation" do
          obj.kill_chain_phases.should eq [] of STIX2::KillChainPhase
        end

        it "Should be possible to append an element" do
          obj.kill_chain_phases << res
          obj.kill_chain_phases.should eq [res]
        end

        it "Should be possible to append an array of elements" do
          obj.kill_chain_phases << [res]
          obj.kill_chain_phases.should eq [res]
        end
      end

      describe "#first_seen" do
        it "Should be modifiable" do
          res = "2016-01-01T00:00:00Z"

          obj.first_seen = res
          obj.first_seen.should eq res
        end
      end

      describe "#last_seen" do
        it "Should be modifiable" do
          res = "2016-05-01T00:00:00Z"

          obj.last_seen = res
          obj.last_seen.should eq res
        end
      end
    end
  end

  describe "#to_json" do
    it "Should succeed" do
      obj.to_json.should_not be_empty
      obj.to_json.should_not be_nil
    end
  end
end
