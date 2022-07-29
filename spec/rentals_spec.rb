require 'json'
require_relative './test_helper'
require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  it 'should be an instance of rental' do
    rental = create_rental

    expect(rental).to be_an_instance_of(Rental)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Rental.new }.to raise_error(ArgumentError)
  end

  it "should have date #{date}" do
    rental = create_rental

    result = rental.date

    expect(result).to eq date
  end

  it "should have a book title #{title}" do
    rental = create_rental

    result = rental.book.title

    expect(result).to eq title
  end

  it "should have a person name #{name}" do
    rental = create_rental

    result = rental.person.name

    expect(result).to eq name
  end

  it 'should generate the correct JSON string' do
    rental = create_rental
    json = JSON.generate(rental)
    p json

    expect(json).to eq rental_json
  end

  it 'shoud create an instance of Rental from a json string' do
    rental = JSON.parse(rental_json, create_additions: true)

    expect(rental).to be_an_instance_of(Rental)
  end

  it "shoud create an instance of Rental with date #{date}" do
    rental = JSON.parse(rental_json, create_additions: true)

    result = rental.date

    expect(result).to eq date
  end

  it "shoud create an instance of Rental with book title #{title}" do
    rental = JSON.parse(rental_json, create_additions: true)

    result = rental.book.title

    expect(result).to eq title
  end

  it "shoud create an instance of Rental with person name #{name}" do
    rental = JSON.parse(rental_json, create_additions: true)

    result = rental.person.name

    expect(result).to eq name
  end
end
