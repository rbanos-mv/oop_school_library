require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super()
    @id = id
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

  def save_rental(rental)
    rentals << rental unless rentals.include?(rental)
  end

  def add_rental(book, date)
    Rental.new(self, book, date)
  end

  private

  def of_age?
    @age >= 18
  end
end
