class Array(T)
  def <<(value : Array(T))
    concat(value)
  end

  def push(value : Array(T))
    concat(value)
  end
end

module STIX2::Macro::CreateMethods
  macro define_add_methods(name)
    def {{name}}
      @{{name}} ||= [] of String
    end
  end
end
