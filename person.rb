require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = `uuidgen`
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def correct_name
    name
  end

  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission
  end
end
