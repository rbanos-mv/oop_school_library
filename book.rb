class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def save_rental(rental)
    @rentals << rental unless @rentals.include?(rental)
  end

  def add_rental(person, date)
    Rental.new(person, self, date)
  end
end
