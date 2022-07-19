require_relative 'capitalize_decorator'
require_relative 'classroom'
require_relative 'person'
require_relative 'student'
require_relative 'trimmer_decorator'
require_relative 'book'
require_relative 'rental'

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name

classroom = Classroom.new
student = Student.new(10, classroom)
puts student.classroom
puts classroom.students

person = Person.new(22, 'maximilianus')
book1 = Book.new('title1', 'author1')
book2 = Book.new('title2', 'author2')

Rental.new(person, book1, '2022-01-01')
Rental.new(person, book2, '2022-01-02')

puts person.rentals
puts book1.rentals
puts book2.rentals
