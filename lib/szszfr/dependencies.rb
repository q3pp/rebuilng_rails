class Object
  def self.const_missing(c)

    return if @calling_conts_missing

    @calling_conts_missing = true
    require Szszfr::Util.to_underscore(c.to_s)
    klass = Object.const_get(c)
    @calling_const_missing = false

    klass
  end
end
