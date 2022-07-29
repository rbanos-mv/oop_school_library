require 'json'
require_relative './test_helper'
require_relative '../book'
require_relative '../rental'
require_relative '../person'

RSpec.describe Person do
  it 'should be an instance of Person' do
    person = create_person

    expect(person).to be_an_instance_of(Person)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Person.new }.to raise_error(ArgumentError)
  end

  it "should have age #{age}" do
    person = create_person

    result = person.age

    expect(result).to eq age
  end

  it "should have name #{name}" do
    person = create_person

    result = person.name

    expect(result).to eq name
  end

  it 'should have no rentals' do
    person = create_person

    result = person.rentals

    expect(result).to be_empty
  end

  it 'should have ONE rental' do
    person = create_person
    book = create_book

    person.add_rental(book, date)

    expect(person.rentals.length).to eq 1
  end

  it 'should generate the correct JSON string' do
    person = create_person
    json = JSON.generate(person)

    expect(json).to eq person_json
  end

  it 'shoud create an instance of Person from a json string' do
    person = JSON.parse(person_json, create_additions: true)

    expect(person).to be_an_instance_of(Person)
  end

  it "shoud create an instance of Person with age #{age}" do
    person = JSON.parse(person_json, create_additions: true)

    result = person.age

    expect(result).to eq age
  end

  it "shoud create an instance of Person with name #{name}" do
    person = JSON.parse(person_json, create_additions: true)

    result = person.name

    expect(result).to eq name
  end
end
