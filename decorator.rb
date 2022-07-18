require_relative 'nameable'

class Decorator < Nameable
  def initialize(object)
    super()
    @object = object
  end

  def correct_name
    @object.correct_name
  end
end
