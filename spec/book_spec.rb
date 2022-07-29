require 'json'
require_relative './test_helper'
require_relative '../book'
require_relative '../rental'
require_relative '../student'
require_relative '../classroom'

RSpec.describe Book do
  it 'should be an instance of Book' do
    book = create_book

    expect(book).to be_an_instance_of(Book)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Book.new }.to raise_error(ArgumentError)
  end

  it "should have title #{title}" do
    book = create_book

    result = book.title

    expect(result).to eq title
  end

  it "should have author #{author}" do
    book = create_book

    result = book.author

    expect(result).to eq author
  end

  it 'should have no rentals' do
    book = create_book

    result = book.rentals

    expect(result).to be_empty
  end

  it 'should have ONE rental' do
    person = create_student
    book = create_book

    book.add_rental(person, date)

    expect(book.rentals.length).to eq 1
  end

  it 'should generate the correct JSON string' do
    book = create_book
    json = JSON.generate(book)

    expect(json).to eq book_json
  end

  it 'shoud create an instance of Book from a json string' do
    book = JSON.parse(book_json, create_additions: true)

    expect(book).to be_an_instance_of(Book)
  end

  it "shoud create an instance of Book with title #{title}" do
    book = JSON.parse(book_json, create_additions: true)

    result = book.title

    expect(result).to eq title
  end

  it "shoud create an instance of Book with author #{author}" do
    book = JSON.parse(book_json, create_additions: true)

    result = book.author

    expect(result).to eq author
  end
end
