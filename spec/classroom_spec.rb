require 'json'
require_relative './test_helper'
require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  it 'should be an instance of Classroom' do
    classroom = create_classroom

    expect(classroom).to be_an_instance_of(Classroom)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Classroom.new }.to raise_error(ArgumentError)
  end

  it "should have label #{label}" do
    classroom = create_classroom

    result = classroom.label

    expect(result).to eq label
  end

  it 'should have no students' do
    classroom = create_classroom

    result = classroom.students

    expect(result).to be_empty
  end

  it 'should have ONE student' do
    classroom = create_classroom
    create_student(classroom)

    result = classroom.students.length

    expect(result).to eq 1
  end

  it 'should generate the correct JSON string' do
    classroom = create_classroom
    json = JSON.generate(classroom)

    expect(json).to eq classroom_json
  end

  it 'shoud create an instance of Classroom from a json string' do
    classroom = JSON.parse(classroom_json, create_additions: true)

    expect(classroom).to be_an_instance_of(Classroom)
  end

  it "shoud create an instance of Classroom with label #{label}" do
    classroom = JSON.parse(classroom_json, create_additions: true)

    result = classroom.label

    expect(result).to eq label
  end

  it 'shoud create an instance of Classroom with NO students' do
    classroom = JSON.parse(classroom_json, create_additions: true)

    result = classroom.students.length

    expect(result).to eq 0
  end

  # it 'shoud create an instance of Classroom and add ONE students' do
  #   classroom = JSON.parse(classroom_json, create_additions: true)

  #   result = classroom.students.length

  #   expect(result).to eq 1
  # end
end
