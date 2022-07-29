require_relative '../nameable'
require_relative '../decorator'

RSpec.describe Nameable do
  it 'should be an instance of Nameable' do
    object = Nameable.new

    expect(object).to be_an_instance_of(Nameable)
  end

  it 'should throw error if nameable.correct_name method is invoked' do
    object = Nameable.new

    expect { object.correct_name }.to raise_error(NotImplementedError)
  end

  it 'should NOT throw error if person.correct_name method is invoked' do
    object = create_person

    expect { object.correct_name }.not_to raise_error
  end
end
