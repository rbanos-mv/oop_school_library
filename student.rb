require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name = 'Unknown', id = Random.rand(1..1000), parent_permission: true)
    super(age, name, id, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@age, @classroom, @name, @id, @parent_permission]
    }.to_json(*args)
  end

  def self.json_create(object)
    age, classroom, name, id, parent_permission = object['data']
    new(age, classroom, name, id, parent_permission: parent_permission)
  end
end
