describe STIX2::Relationship do
  relationship_type = "resolves-to"
  source_ref = "domain-name--3c10e93f-798e-5a26-a0c1-08156efab7f5"
  target_ref = "ipv4-addr--ff26c055-6336-5bc5-b98d-13d6226742dd"

  obj = STIX2::Relationship.new(relationship_type, source_ref, target_ref)
  obj = STIX2::Relationship.new({
    relationship_type: relationship_type,
    source_ref:        source_ref,
    target_ref:        target_ref,
  })

  Spec.before_each do
    obj = STIX2::Relationship.new({
      relationship_type: relationship_type,
      source_ref:        source_ref,
      target_ref:        target_ref,
    })
  end

  describe "Required Common Properties" do
    it "Should have correct created and modified" do
      obj.created.should_not be_nil
      obj.created.to_s.should_not be_empty
      obj.created.class.should eq String

      obj.modified.should_not be_nil
      obj.modified.to_s.should_not be_empty
      obj.modified.class.should eq String
    end

    it "Should have correct spec_version" do
      obj.spec_version.should eq "2.1"
    end

    it "Should have correct id" do
      obj.id.should match(/^relationship--/)
    end

    it "Should have correct object_type" do
      obj.object_type.should eq "relationship"
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

    describe "Relationship Specific Properties" do
      describe "#relationship_type" do
        it "Should be modifiable" do
          res = "new-type"

          obj.relationship_type = res
          obj.relationship_type.should eq res
        end
      end

      describe "#description" do
        it "Should be modifiable" do
          res = "description"

          obj.description = res
          obj.description.should eq res
        end
      end

      describe "#source_ref" do
        it "Should be modifiable" do
          res = "source_ref"

          obj.source_ref = res
          obj.source_ref.should eq res
        end
      end

      describe "#target_ref" do
        it "Should be modifiable" do
          res = "target_ref"

          obj.target_ref = res
          obj.target_ref.should eq res
        end
      end

      describe "#start_time" do
        it "Should be modifiable" do
          res = "start_time"

          obj.start_time = res
          obj.start_time.should eq res
        end
      end

      describe "#stop_time" do
        it "Should be modifiable" do
          res = "stop_time"

          obj.stop_time = res
          obj.stop_time.should eq res
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
