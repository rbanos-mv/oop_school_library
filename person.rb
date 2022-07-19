require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    name
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def add_rental(rental)
    @rentals.push(rental) unless @rentals.include?(rental)
  end

  private

  def of_age?
    @age >= 18
  end
end
