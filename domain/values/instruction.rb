class Instruction
  VALIDATOR = /^[^<>]{2,255}$/
  def initialize(raw)
    raise ArgumentError, "Invalid instruction" unless VALIDATOR.match(raw)
    @raw = raw
  end

  def to_s
    @raw
  end
end
