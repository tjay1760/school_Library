require './app'
def display_options
  puts 'Please choose one of the options: '
  puts '1. - List all books'
  puts '2. - List all people'
  puts '3. - Create a person'
  puts '4. - Create a book'
  puts '5. - Create a rental'
  puts '6. - List all rentals for a given person ID'
  puts '7. - Exit'
end

def option_actions(app, option)
  case option
  when 1
    app.book_lister.list_all_books
  when 2
    app.person_lister.list_all_people
  when 3
    app.person_creator.create_a_person
  when 4
    app.book_creator.create_book
  when 5
    app.rental_creator.create_a_rental
  when 6
    app.rental_lister.list_rentals
  else
    puts 'Thank you for using this app!'
    app.save_data
    exit
  end
end

def input_choice
  puts 'Choose an action'
  choice = gets.chomp.to_i
  while choice.nil? || choice < 1 || choice > 7
    puts 'Invalid input. Please, enter a number between 1 and 7!'
    print 'Enter a number: '
    choice = gets.chomp.to_i
  end
  choice
end

def start_app(app)
  puts 'Welcome to the School Library App!'
  option = 0

  while option != 7
    display_options
    option = input_choice
    option_actions(app, option)
  end
end

def start_app(app)
  puts 'Welcome to the School Library App!'
  option = 0

  while option != 7
    display_options
    option = input_choice
    option_actions(app, option)
  end
end
