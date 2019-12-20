alias STIX2::Type::DictionaryItem = Hash(String, String | Int32 | Int64 | Hash(String, String | Int32 | Int64) | Array(String))
alias STIX2::Type::Dictionary = Hash(String, STIX2::Type::DictionaryItem)

module STIX2::Properties::SCOCommonObjectProperties
  property defanged : Bool?
  setter extensions : STIX2::Type::Dictionary?

  def extensions
    @extensions ||= STIX2::Type::Dictionary.new
  end
end
