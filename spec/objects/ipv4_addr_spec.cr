require "../spec_helper"

describe STIX2::IPv4Addr do
  obj = STIX2::IPv4Addr.new({
    value: "192.0.2.0",
  })

  obj = STIX2::IPv4Addr.new("192.0.2.0")

  Spec.before_each do
    obj = STIX2::IPv4Addr.new({
      value: "192.0.2.0",
    })
  end

  describe "Required Common Properties" do
    it "Should have correct spec_version" do
      obj.spec_version.should eq "2.1"
    end

    it "Should have correct id" do
      obj.id.should match(/^ipv4-addr--/)
    end

    it "Should have correct object_type" do
      obj.object_type.should eq "ipv4-addr"
    end
  end

  describe "Optional Common Properties" do
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

    describe "#defanged" do
      it "Should be modifiable" do
        res = false

        obj.defanged = res
        obj.defanged.should eq res
      end
    end

    describe "#extensions" do
      it "Should be modifiable" do
        res = STIX2::Type::Dictionary.new
        res["x-example-com-foo"] = STIX2::Type::DictionaryItem.new
        res["x-example-com-foo"]["foo_val"] = "foo"

        obj.extensions = res
        obj.extensions.should eq res
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

    describe "IPv4 Addr Object Specific Properties" do
      describe "#value" do
        it "Should be modifiable" do
          res = "example.com"

          obj.value = res
          obj.value.should eq res
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
