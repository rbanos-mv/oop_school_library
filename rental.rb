class Rental
  attr_accessor :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.add_rental(self)
    book.add_rental(self)
  end
end
