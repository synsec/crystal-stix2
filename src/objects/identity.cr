require "json"
require "./properties/common_object_properties"
require "./properties/name"
require "./properties/description"
require "../macro/create_methods"

class STIX2::Identity
  include JSON::Serializable
  include STIX2::Properties::CommonObjectProperties
  include STIX2::Properties::DescriptionProperty
  include STIX2::Macro::CreateMethods

  property name : String
  property identity_class : String
  property contact_information : String?
  setter sectors : Array(String)?
  setter roles : Array(String)?

  def initialize(@name : String, @identity_class : String)
    init_object("identity")
  end

  def initialize(args : NamedTuple(name: String, identity_class: String))
    @name = args[:name]
    @identity_class = args[:identity_class]
    init_object("identity")
  end

  define_add_methods sectors
  define_add_methods roles
end
