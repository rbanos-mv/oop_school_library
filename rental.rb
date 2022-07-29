class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.save_rental(self)
    book.save_rental(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@person, @book, @date]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
