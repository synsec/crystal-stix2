require "../../macro/create_methods"

module STIX2::Properties::LabelsProperty
  include STIX2::Macro::CreateMethods

  setter labels : Array(String)?

  define_add_methods labels
end
