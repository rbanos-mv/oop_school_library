class Rental
  attr_accessor :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.save_rental(self)
    book.save_rental(self)
  end
end
