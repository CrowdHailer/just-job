module Interface
  NotImplemented = Class.new ArgumentError
  MissingMethod = Class.new ArgumentError
  InvalidReturn = Class.new ArgumentError

  def implemented_on?(target)
    target.class.ancestors.first == self
  end

  def required_on!(target)
    raise NotImplemented unless self.implemented_on? target
  end

end
