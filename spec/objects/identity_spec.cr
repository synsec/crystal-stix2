describe STIX2::Identity do
  obj = STIX2::Identity.new({
    name:           "name",
    identity_class: "",
  })

  obj = STIX2::Identity.new("name", "")

  Spec.before_each do
    obj = STIX2::Identity.new({
      name:           "name",
      identity_class: "",
    })
  end

  describe "Required Common Properties" do
    it "Should have correct created and modified" do
      obj.created.should_not be_nil
      obj.created.to_s.should_not be_empty

      obj.modified.should_not be_nil
      obj.modified.to_s.should_not be_empty
    end

    it "Should have correct spec_version" do
      obj.spec_version.should eq "2.1"
    end

    it "Should have correct id" do
      obj.id.should match(/^identity--/)
    end

    it "Should have correct object_type" do
      obj.object_type.should eq "identity"
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

    describe "Identity Specific Properties" do
      describe "#name" do
        it "Should be modifiable" do
          res = "Attacker"

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

      describe "#roles" do
        res = "Botnet operator"

        it "Should be empty right after object creation" do
          obj.roles.should eq [] of String
        end

        it "Should be possible to append an element" do
          obj.roles << res
          obj.roles.should eq [res]
        end

        it "Should be possible to append an array of elements" do
          obj.roles << [res]
          obj.roles.should eq [res]
        end
      end

      describe "#identity_class" do
        it "Should be modifiable" do
          res = "identity_class"

          obj.identity_class = res
          obj.identity_class.should eq res
        end
      end

      describe "#sectors" do
        res = "aerospace"

        it "Should be empty right after object creation" do
          obj.sectors.should eq [] of String
        end

        it "Should be possible to append an element" do
          obj.sectors << res
          obj.sectors.should eq [res]
        end

        it "Should be possible to append an array of elements" do
          obj.sectors << [res]
          obj.sectors.should eq [res]
        end
      end

      describe "#contact_information" do
        it "Should be modifiable" do
          res = "contact_information"

          obj.contact_information = res
          obj.contact_information.should eq res
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
