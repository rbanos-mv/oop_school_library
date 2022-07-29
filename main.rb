require_relative 'app'
require_relative 'input_module'
require_relative 'preserve'

class Main
  attr_reader :app, :preserve

  def initialize
    @app = App.new
    @preserve = Preserve.new(@app)
    @preserve.load_data
  end

  include InputModule

  def menu_options
    "

M E N U
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person id
7 - Exit

Please choose an option by entering a number: "
  end

  def menu
    loop do
      input = numeric_input(menu_options, (1..7))
      case input
      when 1
        app.list_books
      when 2
        app.list_people
      when 3
        app.create_person
      when 4
        app.create_book
      when 5
        app.create_rental
      when 6
        app.list_rentals
      else
        preserve.save_data
        break
      end
    end
  end

  def run
    puts "Welcome to the School Library app!\n"
    menu
    puts 'Thank you for using this app!'
  end
end

main = Main.new
main.run
