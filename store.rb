require_relative "board"

class Store

  def initialize(filename)
    @filename = filename
    @boards = load_boards
  end

  def add_board()
    @boards << new_board
    save
  end

  def update_board(id, data)
    board_found = find_board(id)
    board_found.update(**data)
    save
  end

  def delete_board(id)
    board_found = find_board(id)
    @boards.delete(board_found)
    save
  end

  def find_board(id)
    @boards.find { |board| board.id == id }
  end

  def load_boards
      store = JSON.parse(File.read(@filename), symbolize_names: true)
      store.map { |board| Board.new(board[:id], board[:name], board[:description], board[:lists]) }
  end

  def save
    File.write(@filename, JSON.pretty_generate(@boards))
  end

  def print_boards
    rows = @boards.map { |board| [board.id, board.name] } # Assuming board has an id and name
    table = Terminal::Table.new :headings => ['ID', 'Name'], :rows => rows
    puts table
  end
end
