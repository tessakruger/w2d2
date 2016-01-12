require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  puts "Here is a list of available commands:"
  puts "new - Create a new contact"
  puts "list - List all contacts"
  puts "show - Show a contact"
  puts "search - Search contacts"

  user_choice = gets.chomp

case user_choice
when "new"
	puts "What is your Full Name?"
	name = gets.chomp
	puts "What is your email address?"
	email = gets.chomp
	Contact.create(name, email)
	puts "Your contact information has been added!"

when "list"
	Contact.all()

  # if user_choice == "new"
  # 	puts "new user"
  # elsif user_choice == "list"
  # 	user_choice.all
  # elsif user_choice == "show"
  # 	user_choice.find
  # elsif user_choice == "search"
  # 	user_choice.search
else
  end

end