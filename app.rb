require_relative 'book'
require_relative 'classroom'
require_relative 'input_module'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom = Classroom.new(1)
  end

  include InputModule

  def book_list
    return 'No books to list' if @books.empty?

    result = ''
    @books.each_with_index do |book, index|
      result += "#{index}) #{book.title} by #{book.author}\n"
    end

    result
  end

  def list_books
    puts book_list
  end

  def people_list
    return 'No people to list' if @people.empty?

    result = ''
    @people.each_with_index do |person, index|
      result += "#{index}) ID: #{person.id}, Name: #{person.name}, Age: #{person.age}\n"
    end

    result
  end

  def list_people
    puts people_list
  end

  def create_person
    text = 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = numeric_input(text, (1..2))

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    if type == 1
      letter = letter_input('Has parent permission? [Y/N] ', %w[Y N])
      permission = letter == 'Y'
      new_person = Student.new(age, @classroom, name, parent_permission: permission)
    else
      print 'Specialization: '
      specialization = gets.chomp
      new_person = Teacher.new(age, specialization, name)
    end
    @people.push(new_person)
    puts 'Person created successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully'
  end

  def create_rental
    if @people.empty?
      puts 'No people to list'
      return
    end

    if @books.empty?
      puts 'No books for rent'
      return
    end

    prompt = "\n#{book_list}Select a book from the following list by number: "
    book_index = numeric_input(prompt, (0...@books.length))

    prompt = "\n#{people_list}Select a person from the following list by number (not id): "
    person_index = numeric_input(prompt, (0...@people.length))

    print 'Date: '
    date = gets.chomp
    person = @people[person_index - 1]
    book = @books[book_index - 1]
    @rentals << Rental.new(person, book, date)
    puts 'Rental created successfully'
  end

  def person_by_id
    loop
    print 'ID of person: '
    id = gets.chomp.to_i

    @people.each_with_index do |person, index|
      return index if person.id == id
    end
  end

  def list_rentals
    if @rentals.empty?
      puts 'No rentals to list'
      return
    end

    person_index = person_by_id

    @people[person_index].rentals.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
