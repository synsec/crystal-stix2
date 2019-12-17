require "json"
require "time"

module STIX2::Properties::CreatedModifiedProperty
  include JSON::Serializable

  property created : String?
  property modified : String?

  def set_сreated_to_current_time
    self.created = Time.utc.to_rfc3339
  end

  def set_modified_to_created
    self.modified = self.created
  end
end
