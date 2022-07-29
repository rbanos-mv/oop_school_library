require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown', id = Random.rand(1..1000))
    super(age, name, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@age, @specialization, @name, id]
    }.to_json(*args)
  end

  def self.json_create(object)
    age, specialization, name, id = object['data']
    new(age, specialization, name, id)
  end
end
