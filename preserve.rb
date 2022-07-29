require 'fileutils'
require 'json'

class Preserve
  attr_reader :app, :path

  def initialize(app)
    @app = app
    @path = './json'
    FileUtils.mkdir_p(path)
  end

  def deserialize(file_name, default_value = [])
    fname = "#{path}/#{file_name}"
    return JSON.parse(File.read(fname), create_additions: true) if File.exist?(fname)

    default_value
  end

  def load_data
    app.books = deserialize('books.json')
    app.people = deserialize('people.json')
    app.rentals = deserialize('rentals.json')
  end

  def serialize(file_name, objects)
    fname = "#{path}/#{file_name}"
    File.write(fname, JSON.generate(objects)) unless objects.is_a?(Array) && objects.empty?
  end

  def save_data
    serialize('books.json', app.books)
    serialize('people.json', app.people)
    serialize('rentals.json', app.rentals)
  end
end
