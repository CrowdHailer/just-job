class TodoListName
  VALIDATOR = /^[^<>]{2,80}$/
  def initialize(raw)
    raise ArgumentError, "Invalid name" unless VALIDATOR.match(raw)
    @raw = raw
  end

  def to_s
    @raw
  end

  def ==(other)
    other.is_a?(TodoListName) && to_s == other.to_s
  end
end
