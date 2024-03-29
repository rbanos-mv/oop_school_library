class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label, students = [])
    @label = label
    @students = students
  end

  def add_student(student)
    @students << student unless @students.include?(student)
    student.classroom = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [label]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end
end
