require 'json'
require_relative './test_helper'
require_relative '../book'
require_relative '../rental'
require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  it 'should be an instance of Student' do
    person = create_student

    expect(person).to be_an_instance_of(Student)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Student.new }.to raise_error(ArgumentError)
  end

  it "should have age #{age}" do
    person = create_student

    result = person.age

    expect(result).to eq age
  end

  it "should have name #{name}" do
    person = create_student

    result = person.name

    expect(result).to eq name
  end

  it 'should have no rentals' do
    person = create_student

    result = person.rentals

    expect(result).to be_empty
  end

  it 'should have ONE rental' do
    person = create_student
    book = create_book

    person.add_rental(book, date)

    expect(person.rentals.length).to eq 1
  end

  it 'should generate the correct JSON string' do
    person = create_student
    json = JSON.generate(person)

    expect(json).to eq student_json
  end

  it 'shoud create an instance of Student from a json string' do
    person = JSON.parse(student_json, create_additions: true)

    expect(person).to be_an_instance_of(Student)
  end

  it "shoud create an instance of Student with age #{age}" do
    person = JSON.parse(student_json, create_additions: true)

    result = person.age

    expect(result).to eq age
  end

  it "shoud create an instance of Student with name #{name}" do
    person = JSON.parse(student_json, create_additions: true)

    result = person.name

    expect(result).to eq name
  end
end
