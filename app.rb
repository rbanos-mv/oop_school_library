require_relative 'book'
require_relative 'classroom'
require_relative 'input_module'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

class App
  attr_accessor :books, :classroom, :people, :rentals

  def initialize
    @books = []
    @classroom = Classroom.new(1)
    @people = []
    @rentals = []
  end

  include InputModule

  def book_list
    return 'No books to list' if @books.empty?

    @books.map.with_index do |book, index|
      "#{index}) \"#{book.title}\" by #{book.author}\n"
    end.join
  end

  def list_books
    puts book_list
  end

  def people_list
    return 'No people to list' if @people.empty?

    @people.map.with_index do |person, index|
      "#{index}) [#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}\n"
    end.join
  end

  def list_people
    puts people_list
  end

  def gets_person_info
    text = 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = numeric_input(text, (1..2))
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    [type, age, name]
  end

  def gets_student_permission
    letter = letter_input('Has parent permission? [Y/N] ', %w[Y N])
    letter == 'Y'
  end

  def gets_teacher_specialization
    print 'Specialization: '
    gets.chomp
  end

  def create_person
    type, age, name = gets_person_info

    if type == 1
      permission = gets_student_permission
      new_person = Student.new(age, @classroom, name, parent_permission: permission)
    else
      specialization = gets_teacher_specialization
      new_person = Teacher.new(age, specialization, name)
    end
    @people.push(new_person)
    puts 'Person created successfully'
  end

  def gets_book_info
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    [title, author]
  end

  def create_book
    title, author = gets_book_info
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book created successfully'
  end

  def gets_rental_info
    prompt = "\n#{book_list}Select a book from the previous list by number: "
    book_index = numeric_input(prompt, (0...@books.length))

    prompt = "\n#{people_list}Select a person from the previous list by number (not id): "
    person_index = numeric_input(prompt, (0...@people.length))

    print 'Date: '
    date = gets.chomp
    [book_index, person_index, date]
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

    book_index, person_index, date = gets_rental_info

    person = @people[person_index]
    book = @books[book_index]
    @rentals << Rental.new(person, book, date)
    puts 'Rental created successfully'
  end

  def person_by_id(text)
    loop do
      print text
      id = gets.chomp.to_i

      found = @people.find(-> {}) { |person| person.id == id }
      return id unless found.nil?
    end
  end

  def rental_list(person_id)
    rentals.map do |rental|
      "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}\n" if rental.person.id == person_id
    end.join
  end

  def list_rentals
    if @rentals.empty?
      puts 'No rentals to list'
      return
    end

    person_id = person_by_id('ID of person: ')
    list = rental_list(person_id)
    puts 'No rentals to list' if list.empty?
    puts list unless list.empty?
  end
end
