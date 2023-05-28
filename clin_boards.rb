require "json"
require "terminal-table"
require_relative "board"
require_relative "store"

class ClinBoards
  def initialize
    @store = Store.new("store.json")
  end

  def start
    puts "
    ####################################
    #      Welcome to CLIn Boards      #
    ####################################"
    action = ""
    until action == "exit"
      @store.print_boards
        options = ["create", "show ID", "update ID", "delete ID", "exit"]
        action, id, data = menu(options) # Assuming menu returns the required data for each operation
        print "> "
        case action
        when "create"
            new_board = add_board(*data)
            @store.add_board(new_board)
        when "show"
            board = @store.find_board(id)
        when "update"
            @store.update_board(id, data)
        when "delete"
            @store.delete_board(id)
        when "exit"
            puts "####################################
                  #   Thanks for using CLIn Boards   #
                  ####################################"
        else
            puts "Unknown option: #{action}"
        end
    end

    @store.save_boards
end

  def print_table(list:, title:, headings:)
    table = Terminal::Table.new
    table.title = title
    table.headings = headings
    table.rows = list.map(&:details)
    puts table
  end

app = ClinBoards.new
app.start
end