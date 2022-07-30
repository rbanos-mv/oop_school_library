require_relative './test_helper'
require_relative '../person'
require_relative '../nameable'
require_relative '../decorator'
require_relative '../capitalize_decorator'
require_relative '../trimmer_decorator'

RSpec.describe Decorator do
  it 'should be an instance of Decorator' do
    person = create_person
    object = Decorator.new(person)

    expect(object).to be_an_instance_of(Decorator)
  end

  it 'should throw an ArgumentError if incorrect number of parameters' do
    expect { Book.new }.to raise_error(ArgumentError)
  end

  it 'should NOT throw error if correct_name method is invoked' do
    object = create_person
    decorated_object = Decorator.new(object)

    expect { decorated_object.correct_name }.not_to raise_error
  end

  it "should return the person's name, capitalized" do
    person = Person.new(age, name)

    capitalized_person = CapitalizeDecorator.new(person)

    result = capitalized_person.correct_name

    expect(result).to eq name.capitalize
  end

  it "should return the person's name, trimmered" do
    person = Person.new(age, name)

    trimmered_person = TrimmerDecorator.new(CapitalizeDecorator.new(person))

    result = trimmered_person.correct_name

    expect(result.length).to eq 10
  end
end
