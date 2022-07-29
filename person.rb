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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@age, @name, @id, @parent_permission]
    }.to_json(*args)
  end

  def self.json_create(object)
    age, name, id, parent_permission = object['data']
    new(age, name, id, parent_permission: parent_permission)
  end

  private

  def of_age?
    @age >= 18
  end
end
