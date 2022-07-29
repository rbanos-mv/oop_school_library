require 'json'
require_relative './test_helper'
require_relative '../book'
require_relative '../rental'
require_relative '../teacher'
require_relative '../classroom'

RSpec.describe Teacher do
  it 'should be an instance of Teacher' do
    person = create_teacher

    expect(person).to be_an_instance_of(Teacher)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Teacher.new }.to raise_error(ArgumentError)
  end

  it "should have age #{age}" do
    person = create_teacher

    result = person.age

    expect(result).to eq age
  end

  it "should have name #{name}" do
    person = create_teacher

    result = person.name

    expect(result).to eq name
  end

  it "should have specialization #{specialization}" do
    person = create_teacher

    result = person.specialization

    expect(result).to eq specialization
  end

  it 'should have no rentals' do
    person = create_teacher

    result = person.rentals

    expect(result).to be_empty
  end

  it 'should have ONE rental' do
    person = create_teacher
    book = create_book

    person.add_rental(book, date)

    expect(person.rentals.length).to eq 1
  end

  it 'should generate the correct JSON string' do
    person = create_teacher
    json = JSON.generate(person)

    expect(json).to eq teacher_json
  end

  it 'shoud create an instance of Teacher from a json string' do
    person = JSON.parse(teacher_json, create_additions: true)

    expect(person).to be_an_instance_of(Teacher)
  end

  it "shoud create an instance of Teacher with age #{age}" do
    person = JSON.parse(teacher_json, create_additions: true)

    result = person.age

    expect(result).to eq age
  end

  it "shoud create an instance of Teacher with name #{name}" do
    person = JSON.parse(teacher_json, create_additions: true)

    result = person.name

    expect(result).to eq name
  end
end
