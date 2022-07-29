def title
  'BOOK TITLE'
end

def author
  'AUTHOR NAME'
end

def create_book
  Book.new(title, author)
end

def book_json
  "{\"json_class\":\"Book\",\"data\":[\"#{title}\",\"#{author}\"]}"
end

def label
  '101'
end

def create_classroom
  Classroom.new(label)
end

def classroom_json
  "{\"json_class\":\"Classroom\",\"data\":[\"#{label}\"]}"
end

def id
  123
end

def age
  23
end

def name
  'PERSON NAME'
end

def create_person
  Person.new(age, name, id)
end

def person_json
  "{\"json_class\":\"Person\",\"data\":[#{age},\"#{name}\",#{id},true]}"
end

def date
  '2020-01-01'
end

def create_rental
  book = create_book
  person = create_person
  Rental.new(person, book, date)
end

def rental_json
  "{\"json_class\":\"Rental\",\"data\":[{\"json_class\":\"Person\",\"data\":[#{age},\"#{name}\",#{id},true]},\
{\"json_class\":\"Book\",\"data\":[\"#{title}\",\"#{author}\"]},\"#{date}\"]}"
end

def create_student(classroom = create_classroom)
  Student.new(age, classroom, name, id)
end

def student_json
  "{\"json_class\":\"Student\",\"data\":[#{age},{\"json_class\":\"Classroom\",\
\"data\":[\"101\"]},\"#{name}\",#{id},true]}"
end

def specialization
  'Mathematics'
end

def create_teacher
  Teacher.new(age, specialization, name, id)
end

def teacher_json
  "{\"json_class\":\"Teacher\",\"data\":[#{age},\"#{specialization}\",\"#{name}\",#{id}]}"
end
