require "../../macro/create_methods"

module STIX2::Properties::AliasesProperty
  include STIX2::Macro::CreateMethods

  setter aliases : Array(String)?

  define_add_methods aliases
end
