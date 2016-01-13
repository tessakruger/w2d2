require 'csv'
require 'pry'

# Represents a person in an address book.
class Contact

  attr_accessor :name, :email

  def initialize(name, email)
    # TODO: Assign parameter values to instance variables.
    @name = name
    @email = email
  end

  # Provides functionality for managing a list of Contacts in a database.
  class << self

    # Returns an Array of Contacts loaded from the database.
    def all
      # TODO: Return an Array of Contact instances made from the data in 'contacts.csv'.
    @contacts = []
    CSV.foreach("contacts.csv") do |row|
      @contacts << row
      end
    @contacts
    end

    # Creates a new contact, adding it to the database, returning the new contact.
    def create(name, email)
      # TODO: Instantiate a Contact, add its data to the 'contacts.csv' file, and return it.
      CSV.open("contacts.csv", "a") do |csv|
      csv << [name, email]
      end

    end

    # Returns the contact with the specified id. If no contact has the id, returns nil.
    def find(id)
      # TODO: Find the Contact in the 'contacts.csv' file with the matching id.
     i = 0
     listing = ''
     CSV.foreach("contacts.csv") do |line|
      i += 1
      if id == i
        return line
        end
      end
       if listing == ''
        listing = "No user found."
      end
      listing
    end

    # Returns an array of contacts who match the given term.
    def search(term)
      # TODO: Select the Contact instances from the 'contacts.csv' file whose name or email attributes contain the search term.
    listing = ''
    CSV.foreach("contacts.csv") do |row|
      line = "#{row[0]}, (#{row[1]})"
      if line.downcase.match (/.*#{term.downcase}.*/)
        listing << "\n#{row[0]}, (#{row[1]})"
        end
      end
      if listing == ''
        listing = "No user found."
      end
      listing
    end

  end

end
